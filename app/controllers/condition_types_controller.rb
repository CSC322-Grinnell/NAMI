class ConditionTypesController < ApplicationController
    def index
        @ctypes = ConditionType.all
    end
end
