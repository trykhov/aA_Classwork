# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates :email, :password_digest, :session_token, presence: true
    validates :email, uniqueness: true

    # this is called each time an ActiveRecord object is initialized or loaded from the DB
    # this makes sure that the User instance has a session_token
    after_initialize :ensure_session_token 
    attr_reader :password # allow a getter method

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end 

    def reset_session_token!
        # self.class --> User
        # session_token is a method from ActionController::Base (remember User < ApplicationRecord < ActionController::Base)
        self.session_token = self.class.generate_session_token
        self.save! # ensure that the session_token is updated in the DB
        self.session_token # return the new session_token
    end 

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def password=(password)
        @password = password # initialize the password instance variable
        # BCrypt::Password.create(password) creates a hash value and returns it as a string
        self.password_digest = BCrypt::Password.create(password)
    end

    # instance variable of User
    def is_password?(password)
        # the following is_password? is not the current is_password that's being defined
        # it's an instance method of BCrypt::Password.new(self.password_disgest)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        # determine if the user's email is valid
        user = User.find_by(email: email)
        # if the user is not nil, then we can call the is_password? method on it and check
        # to see if the password is correct
        user && user.is_password?(password) ? user : nil
    end
end
