class Provider < ApplicationRecord
  has_and_belongs_to_many :waivers
  has_and_belongs_to_many :services
  has_and_belongs_to_many :insurances

  validates :name,  presence: true
  validates :address, presence: true
  validates :phone, presence: true

  scope :by_services, -> (service_ids) {
    joins(:services).where(services: {id: service_ids })
  }

  scope :by_insurances, -> (insurance_ids) {
    joins(:insurances).where(insurances: {id: insurance_ids })
  }

  scope :by_waivers, -> (waiver_ids) {
    joins(:waivers).where(waivers: {id: waiver_ids })
  }

  include PgSearch::Model
  # provider search by name (from the nav bar)
  pg_search_scope :search_name, against: [:name], using: {
                    tsearch: { prefix: true }
                  }
  # advanced search
  pg_search_scope :search_all,
                  against: [:name], using: {tsearch: {prefix: true}},
                  associated_against: {
                    services: :id,
                    insurances: :id,
                    waivers: :id
                  }
end
