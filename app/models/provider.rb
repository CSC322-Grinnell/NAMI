class Provider < ApplicationRecord
    validates :practiceName,  presence: true
    validates :address, presence: true
    validates :phone, presence: true
end