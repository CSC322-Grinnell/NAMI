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
   
   def advanced_search_result
      criteria = params[:criteria]
      query = params[:query]
      search_function = "search_#{criteria}"
      
      if criteria == nil
         @results = Provider.all
      elsif query != nil
         @results = Provider.public_send(search_function, query)
      else
         @results = Provider.all
      end
   end

end