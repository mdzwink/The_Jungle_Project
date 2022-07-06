class User < ApplicationRecord

  has_secure_password

validates :email, presence: true, uniqueness: {case_sensitive: false} 
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 8, maximum: 20 }
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    user = self.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end



# test, must have:
# unique email (not ase sensitive)
# no duplicate emails
