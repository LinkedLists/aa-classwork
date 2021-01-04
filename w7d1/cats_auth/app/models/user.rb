class User < ApplicationRecord
  validates :user_name, presence: :true, uniqueness: :true
  validates :password_digest, presence: :true

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
end
