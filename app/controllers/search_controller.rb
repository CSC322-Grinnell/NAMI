class SearchController < ApplicationController
   include CheckboxParams

   def search
      if params[:query].present?
         @results = Provider.search_name(params[:query])
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
      name = params[:query]
      service = params[:service_options]
      insurance = params[:insurance_options]

      if ([name, service, insurance].count{ |q| q=="" }) == 3
        @results = Provider.order(name: :desc)
      else
        @results = Provider.search_all([name, service, insurance])
      end
   end
end
