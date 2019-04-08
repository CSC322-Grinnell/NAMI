class SearchController < ApplicationController
   
def search
   if params[:query].present?
        @results = Provider.search_practiceName(params[:query])
   # @results = Provider.where("address like ?", "#{params[:query]}%")
   else
     @results = Provider.all
   end
end

end