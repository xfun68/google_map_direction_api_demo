require 'google_directions'

class MapController < ApplicationController
  include GoogleDirections

  def search
    @title = "Show me the way!"
    @has_search_result = false
    return if params[:map].nil?

    json_result = search_routes(params["map"]["start_address"], params["map"]["end_address"])
    @search_result = ActiveSupport::JSON.decode(json_result)
    @has_search_result = true if @search_result["status"]  == "OK"
  end
end
