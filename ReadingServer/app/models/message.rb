class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String

  has_one :sender, class_name: 'User', inverse_of: 'User'
  has_one :receiver, class_name: 'User', inverse_of: 'User'

  validates_presence_of :content, :sender, :receiver
end