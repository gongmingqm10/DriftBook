class Api::MessagesController < ApiController

  def conversation
    user = User.find(params[:user_id])

    return render status: :bad_request, json: {message: 'User not exists'} unless user

    messages = Message.any_of({sender: user}, {receiver: user}).order_by(:updated_at.desc)

    @conversations = []
    messages.each { |message|
      friend = message.sender == user ? message.receiver : message.sender
      conversation = conversation_contains friend
      if conversation
        conversation.add message
      else
        @conversations.append Conversation.new(friend, message)
      end
    }
    render status: :ok
  end

  private

  def conversation_contains(user)
    @conversations.each { |conversation|
      return conversation if conversation.user == user
    }
    nil
  end

end