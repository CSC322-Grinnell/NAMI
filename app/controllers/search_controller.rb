class SearchController < ApplicationController
   
   def search
      if params[:query].present?
         @results = Provider.search_practiceName(params[:query])
      else
         @results = Provider.all
      end
   end

   def advanced_search
   end

end