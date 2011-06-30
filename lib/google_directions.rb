require 'http_get'

module GoogleDirections

  DOMAIN = "maps.googleapis.com"
  PATH = "/maps/api/directions/json"

  def search_routes(start_address, end_address)
    params = {:origin => start_address, :destination => end_address, :sensor => "false"}
    http_get(DOMAIN, PATH, params)
  end
end
