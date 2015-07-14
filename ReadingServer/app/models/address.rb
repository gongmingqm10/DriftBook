class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  field :longitude, type: Float
  field :latitude, type: Float
  field :city, type: String
  field :province, type: String
  field :street, type: String

  validates_presence_of :longitude, :latitude

end
