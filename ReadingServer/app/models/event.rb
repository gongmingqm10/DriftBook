class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :category, type: Strng

  embeds_one :location, class_name: 'Address'

  belongs_to :user, class_name: 'User', inverse_of: :events
  belongs_to :book, class_name: 'Book', inverse_of: :events

  validates_inclusion_of :category, in: %w(drift, mark)

end