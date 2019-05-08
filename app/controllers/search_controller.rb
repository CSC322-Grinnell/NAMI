class SearchController < ApplicationController
   include CheckboxParams
   
   def search
      if params[:query].present?
         @results = Provider.search_practiceName(params[:query])
      else
         @results = Provider.all
      end
   end
   
   def go_to_profile
      @provider = Provider.find(params[:id])
   end

   def advanced_search
      @search_criteria = search_criteria
      @waiver_params = waiver_params
      @insurance_params = insurance_params
      @address_params = address_params
   end
   
   def advanced_search_result
      puts(params)
      
      criteria = params[:criteria]
      
      waiver = params[:waiveroptions]
      insurance = params[:insuranceoptions]
      address = params[:addressoptions]
      practiceName = params[:query]
   
      @results = Provider.search_all([waiver, insurance, address, practiceName])
      
      
      # if criteria == nil
      #    @results = Provider.all
      # elsif waiver != nil 
      #    @results = Provider.public_send(search_function, waiver)
      # elsif insurance != nil 
      #    @results = Provider.public_send(search_function, insurance)
      # else
      #    @results = Provider.all
      # end
   end

end