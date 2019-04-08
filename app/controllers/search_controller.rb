class SearchController < ApplicationController
   
def search
   if params[:query].present?
       puts params[:query]
       puts params[:locale]
        @results = Provider.search_practiceName(params[:query])
   else
     @results = Provider.all
   end
end

end