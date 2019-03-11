class User < ApplicationRecord
    belongs_to :provider
    validates :username,  presence: true, uniqueness: true, length: { maximum: 50 }
    has_secure_password
    validates :password, presence: true, length: { minimum: 9 }
end
