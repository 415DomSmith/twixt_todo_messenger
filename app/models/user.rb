class User < ActiveRecord::Base
	has_secure_password
	# has_secure_password replaces the :password validation below
	
	# validates :password, length: 8..20
	validates :password, length: { minimum: 8}, allow_blank: true

	validates :first_name, presence: true

	validates :email, 
		presence: true, 
		uniqueness: true, 
		format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	has_many :associations, dependent: :destroy
	has_many :groups, through: :associations

	def generate_password_reset_token!
		update(password_reset_token: SecureRandom.urlsafe_base64(48))
	end

end

