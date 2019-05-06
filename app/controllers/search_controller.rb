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
      @waiver_params = waiver_params
      @insurance_params = insurance_params
   end
   
   def advanced_search_result
      puts("ARYAN LOOK AT THIS")
      puts(params)
      
      criteria = params[:criteria]
      
      waiver = params[:waiveroptions]
      insurance = params[:insuranceoptions]
      
      search_function = "search_#{criteria}"
      
      if criteria == nil
         @results = Provider.all
      elsif waiver != nil 
         @results = Provider.public_send(search_function, waiver)
      elsif insurance != nil 
         @results = Provider.public_send(search_function, insurance)
      else
         @results = Provider.all
      end
   end

end