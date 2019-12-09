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
    name = params[:name]
    services = params[:query][:service_ids].select { |e| e != "" }
    insurances = params[:query][:insurance_ids].select { |e| e != "" }
    waivers = params[:query][:waiver_ids].select { |e| e != "" }

    puts("SERVICES: #{services}")
    if ([name, services, insurances, waivers].count{ |q| q.blank? }) == 4
      @results = Provider.order(name: :asc)
    else
      @results = Provider.by_services(services)
                         .by_insurances(insurances)
                         .by_waivers(waivers)
                         .search(name).uniq
    end
  end
end
