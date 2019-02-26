class Provider < ApplicationRecord
    has_many :waivers
    validates :practiceName,  presence: true
    validates :address, presence: true
    validates :phone, presence: true
end