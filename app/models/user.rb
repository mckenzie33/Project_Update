class User < ActiveRecord::Base


  attr_accessible :name, :email, :remember_token, :avatar, :password, :password_confirmation
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6, :allow_blank => true }
  mount_uploader :avatar, AvatarUploader

  #This method is associated with password reset, it generates a pw reset token
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  #returns a randomly generated token for sessions and password recovery
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  #create a new token for session cookies
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  #encryps token (saved for password_digest and remember_token)
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    #this will give the user a session token to be saved in cookies 
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
0