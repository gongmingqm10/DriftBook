class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :password, type: String
  field :password_hash, type: String
  field :password_salt, type: String
  field :avatar, type: String
  field :wechat, type: String
  field :email, type: String
  field :telephone, type: String

  attr_accessor :password

  embeds_one :address, class_name: 'Address'
  has_many :own_books, class_name: 'Book', inverse_of: :owner
  has_many :hold_books, class_name: 'Book', inverse_of: :holder
  has_many :events, class_name: 'Event', inverse_of: :user
  has_many :messages_send, class_name: 'Message', inverse_of: :sender
  has_many :messages_receive, class_name: 'Message', inverse_of: :receiver

  validates_uniqueness_of :email
  validates_presence_of :email, :password

  before_save :encrypt_password

  class << self
    def authenticate (email, password)
      user = find_by(email: email.downcase)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      end
    end
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end



end
