class Book
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :author, type: String
  field :summary, type: String
  field :doubanid, type: Integer

  belongs_to :owner, class_name: 'User', inverse_of: :books
  belongs_to :holder, class_name: 'User', inverse_of: :books
  has_many :events, class_name: 'Event', inverse_of: :book

  validates_presence_of :name, :owner

end