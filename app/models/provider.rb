class Provider < ApplicationRecord
  has_and_belongs_to_many :waivers
  has_and_belongs_to_many :services
  has_and_belongs_to_many :insurances

  validates :name,  presence: true
  validates :address, presence: true
  validates :phone, presence: true

  scope :by_services, -> (service_ids) {
    joins(:services).where(services: {id: service_ids }) if service_ids.present?
  }

  scope :by_insurances, -> (insurance_ids) {
    joins(:insurances).where(insurances: {id: insurance_ids }) if insurance_ids.present?
  }

  scope :by_waivers, -> (waiver_ids) {
    joins(:waivers).where(waivers: {id: waiver_ids }) if waiver_ids.present?
  }

  include PgSearch::Model
  # provider search by name (from the nav bar)
  pg_search_scope :search_name, against: [:name], using: {
                    tsearch: { prefix: true }
                  }

  def self.search(query)
    if query.present?
      search_name(query)
    else
      order(name: :asc)
    end
  end
end
