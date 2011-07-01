require 'google_directions'

class MapController < ApplicationController
  include GoogleDirections

  def search
    @title = "Show me the way!"
    return if params[:map].nil?

    @query = Query.new params[:map]
    if @query.valid?
      @routes = Routes.new(search_routes(@query.start_address, @query.end_address))
    end
  end
end
