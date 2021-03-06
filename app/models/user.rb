# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  fname           :string
#  lname           :string
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

	validates :email, :password_digest, :session_token, presence: true
	validates :email, :session_token, uniqueness: true
	validates :password, length: { minimum: 6, allow_nil: true}

	attr_reader :password

	after_initialize :ensure_session_token

	has_many :shops,
		class_name: "Shop",
		foreign_key: :owner_id,
		primary_key: :id

	has_many :requested_reservations,
		class_name: "Reservation",
		foreign_key: :renter_id,
		primary_key: :id

	has_many :pending_reservations,
		class_name: "Reservation",
		foreign_key: :owner_id,
		primary_key: :id

	has_many :reviews

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user && user.valid_password?(password)
    user
  end

	def self.find_or_create_by_auth_hash(auth_hash)
		user = User.find_by(
					 provider: auth_hash[:provider],
					 uid: auth_hash[:uid])

		unless user
			user = User.create!(
					 provider: auth_hash[:provider],
					 uid: auth_hash[:uid],
					 fname: auth_hash[:info][:name].split.first,
					 lname: auth_hash[:info][:name].split.last,
					 email: auth_hash[:info][:email],
					 password: SecureRandom::urlsafe_base64)
		end
		user
	end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
