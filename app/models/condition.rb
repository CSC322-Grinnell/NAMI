class Condition < ApplicationRecord
  belongs_to :condition_type
  has_and_belongs_to_many :services

  def index
    @conditions = Condition.all
  end
end
