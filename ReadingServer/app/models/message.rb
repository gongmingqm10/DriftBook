class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String

  belongs_to :sender, class_name: 'User', inverse_of: 'messages_send'
  belongs_to :receiver, class_name: 'User', inverse_of: 'messages_receive'

  validates_presence_of :content, :sender, :receiver
end