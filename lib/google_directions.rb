require 'http_get'

module GoogleDirections

  DOMAIN = "maps.googleapis.com"
  PATH = "/maps/api/directions/json"

  def search_routes(start_address, end_address)
    query_stirng = {:origin => start_address, :destination => end_address, :sensor => "false"}
    http_get(DOMAIN, PATH, query_stirng)
  end
end
