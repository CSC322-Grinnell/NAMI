class ConditionsController < ApplicationController
    def index
        @conditions = Condition.order(name: :asc)
    end
    def info
      @c = Condition.find_by(name: (params[:name].gsub("_", " ")))
    end
end

# TODO:
# We need to figure out a way to automatically alphabetize 
# the conditions/disorders on this page, rather than having
# to do it by hand every time a new one is added to the 
# system. For whoever works on this next, see if there's an
# algorithm or some sort of instruction for implementing this
# online somewhere.