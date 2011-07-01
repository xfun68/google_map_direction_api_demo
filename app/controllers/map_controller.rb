require 'google_directions'

class MapController < ApplicationController
  include GoogleDirections

  def search
    @title = "Show me the way!"
    @has_search_result = false
    return if params[:map].nil?

    @query = Query.new params[:map]
    if @query.valid?
      json_result = search_routes(@query.start_address, @query.end_address)
      @search_result = ActiveSupport::JSON.decode(json_result)
      @has_search_result = true if @search_result["status"]  == "OK"
    end
  end
end
