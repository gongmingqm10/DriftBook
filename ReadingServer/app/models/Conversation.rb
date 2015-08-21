class Conversation
  attr_accessor :user
  attr_accessor :messages

  def initialize (user, message)
    @user = user
    @messages = []
    add message
  end

  def add(message)
    return unless message
    @messages.append message
  end

end