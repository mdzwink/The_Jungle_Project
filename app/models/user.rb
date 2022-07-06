class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 8, maximum: 20 }
  validates :password_confirmation, presence: true

  # class authenticate_with_credentials(email, password)

  # end
end



# test, must have:
# unique email (not ase sensitive)
# no duplicate emails
