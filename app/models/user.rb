class User < ApplicationRecord
  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many  :microposts
  validates :name, presence: true, length: {maximum:50}
  validates :email, presence: true, length: {maximum:255},
                    format: { with: VALID_EMAIL_FORMAT },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  before_save { email.downcase! }
end