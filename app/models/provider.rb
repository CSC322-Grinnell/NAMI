class Provider < ApplicationRecord
    has_and_belongs_to_many :waivers
    has_and_belongs_to_many :services
    has_and_belongs_to_many :insurances

    validates :name,  presence: true
    validates :address, presence: true
    validates :phone, presence: true

    include PgSearch
    # provider search by name (from the nav bar)
    pg_search_scope :search_name, against: [:name], using: {
                    tsearch: { prefix: true }
                    }
    # advanced search
    pg_search_scope :search_all,
                    against: [:name],
                    associated_against: {
                      services: :name,
                      insurances: :name,
                    }
end
