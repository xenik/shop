class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :admin
	has_secure_password     
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  validates :name,  presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 } 
	validates :password_confirmation, presence: true

  after_destroy :ensure_an_admin_remains	   

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def ensure_an_admin_remains
    if User.where(admin: true).count.zero?
      raise "The last user cann't be deleted."
    end
  end
end
