class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one :provider
    validates :username,  presence: true, uniqueness: true, length: { maximum: 50 }
    has_secure_password
    validates :password, presence: true, length: { minimum: 9 }
end
