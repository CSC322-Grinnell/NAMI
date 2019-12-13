class Waiver < ApplicationRecord
  has_and_belongs_to_many :services
  has_and_belongs_to_many :providers
end
