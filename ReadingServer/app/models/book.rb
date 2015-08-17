class Book
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :author, type: String
  field :summary, type: String
  field :doubanid, type: String
  field :status, type: String
  field :image, type: String

  belongs_to :owner, class_name: 'User', inverse_of: :owe_books
  belongs_to :holder, class_name: 'User', inverse_of: :hold_books
  has_many :events, class_name: 'Event', inverse_of: :book

  validates_presence_of :name, :owner
  validates_inclusion_of :status, in: %w( drifting reading stop )

  def address
    owner.address
  end

end
