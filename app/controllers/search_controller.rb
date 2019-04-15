class SearchController < ApplicationController
   include CheckboxParams
   
   def search
      if params[:query].present?
         @results = Provider.search_practiceName(params[:query])
      else
         @results = Provider.all
      end
   end

   def advanced_search
      @search_criteria = search_criteria
   end

end