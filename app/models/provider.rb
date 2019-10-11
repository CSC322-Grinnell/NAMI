class Provider < ApplicationRecord
    has_many :waivers
    has_many :services
    validates :practiceName,  presence: true
    validates :address, presence: true
    validates :phone, presence: true
    belongs_to :user
    include PgSearch::Model
    pg_search_scope :search_practiceName, against: [:practiceName], using: {
                    tsearch: { prefix: true }
    }
    pg_search_scope :search_address, against: [:address], using: {
                    tsearch: { prefix: true }
    }
    pg_search_scope :search_waiver, against: [:waiver], using: {
                    tsearch: { prefix: true }
    }
    pg_search_scope :search_insurance, against: [:insurance],using: {
                    tsearch: { prefix: true }
    } 
    
    
    # Search function 
    pg_search_scope :search_all, against: [
        [:waiver, 'A'],
        [:insurance, 'B'],
        [:address, 'C'],
        [:practiceName, 'D']
    ]
    
    
end