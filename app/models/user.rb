class User < ActiveRecord::Base

	attr_accessor :remember_token

	before_save :lowercase_email, :generate_email_key

	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: { maximum: 255 },
        			format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    # before save

    def lowercase_email
    	self.email = email.downcase
    end

    def generate_email_key
    	self.emailkey = (0...8).map { (65 + rand(26)).chr }.join
    end

    def generate_random_password
    	self.password = (0...8).map { (65 + rand(26)).chr }.join
    end

	# Returns the hash digest of the given string.
	def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	end
    
    # Returns a random token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

  # Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forgets a user.
	def forget
	    update_attribute(:remember_digest, nil)
	end

	# def confirmed
	# 	if password.nil? 
	# 		return false 
	# 	else 
	# 		return true 
	# 	end
	# end

	# def confirmed_status
	# 	if password.nil?
	# 		return "confirmed"
	# 	else 
	# 		return "not yet confirmed"
	# 	end
	# end



end

