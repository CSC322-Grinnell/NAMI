class SearchController < ApplicationController
   
def search
   if params[:query].present?
       puts params[:query]
    #  @results = Provider.search(params[:query])
    @results = Provider.where("address like ?", "#{params[:query]}%")
        puts "results is #{@results}"
   else
     @results = Provider.all
   end
end

end