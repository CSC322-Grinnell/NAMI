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

  def advanced_search_result
    name = params[:query]
    services = params[:service_ids]
    insurances = params[:insurance_ids]
    waivers = params[:waiver_ids]

    if ([name, services, insurances, waivers].count{ |q| q.blank? }) == 4
      @results = Provider.order(name: :asc)
    else
      @results = Provider.all
      unless services.nil?
        @results = Provider.by_services(services)
      end
      @results = @results.search_name(name)
    end
  end
end
