class Service < ApplicationRecord
  has_and_belongs_to_many :waivers
  has_and_belongs_to_many :conditions
  has_and_belongs_to_many :providers
end
