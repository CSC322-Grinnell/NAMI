class Provider < ApplicationRecord
    has_and_belongs_to_many :waivers
    has_and_belongs_to_many :services
    has_and_belongs_to_many :insurances

    validates :name,  presence: true
    validates :address, presence: true
    validates :phone, presence: true

    include PgSearch
    pg_search_scope :search_name, against: [:name], using: {
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
        [:name, 'D']
    ]
end
