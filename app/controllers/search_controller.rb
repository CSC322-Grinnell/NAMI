class SearchController < ApplicationController
   
def search
   if params[:query].present?
     results = Provider.search(params[:query])
     puts @results
   else
     @results = Provider.all
     puts @results
   end
 end

end