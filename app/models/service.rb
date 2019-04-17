class Service < ApplicationRecord
    serialize :services, Array
    belongs_to :provider
end
