class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one :provider, dependent: :destroy
    validates :password, presence: true, length: { minimum: 6 }
    accepts_nested_attributes_for :provider, allow_destroy: true
end
