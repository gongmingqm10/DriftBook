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

  embeds_one :address, class_name: 'Address'
  has_many :own_books, class_name: 'Book', inverse_of: :user
  has_many :hold_books, class_name: 'Book', inverse_of: :user
  has_many :events, class_name: 'Event', inverse_of: :user

  validates_uniqueness_of :email
  validates_presence_of :email, :password

  class << self
    def authenticate (username, password)
      user = find_by(user_number: username.downcase)
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
