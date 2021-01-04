class User < ApplicationRecord
  validates :user_name, presence: :true, uniqueness: :true
  validates :password_digest, presence: :true
  after_intialize :ensure_session_token

  def self.find_by_credentials(username, pw)
    user = User.find(user_name: username)

    if user && user.is_password?(pw)
      user
    else
      nil
    end
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
  end

  def password=(password)#maybe we will need the attr_reader for password later
    self.password_digest = BCrypt::Password.create(password)
    #@password = password ##needed later
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end
end
