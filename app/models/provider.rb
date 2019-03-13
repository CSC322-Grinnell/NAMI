class Provider < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :waivers
    validates :practiceName,  presence: true
    validates :address, presence: true
    validates :phone, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+(\.){1}[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
end