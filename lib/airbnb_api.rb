require 'http'

module Airbnb
  # Service for all Airbnb API calls
  class AirbnbApi
    #Setting the URL and parameters
    Airbnb_URL = 'https://api.airbnb.com/'
    API_VER = 'v2'
    Airbnb_API_URL = URI.join(Airbnb_URL, "#{API_VER}/")
    Search_URL = URI.join(Airbnb_API_URL, "search_results")

  #  attr_reader :airbnb_data
    def initialize(airbnb_id:)
        @airbnb_id = airbnb_id
    end

    def rooms_info(location)
      rooms_response = HTTP.get(Search_URL,
        params: { client_id: @airbnb_id,
                  location: location
                })
      roomsinfo = JSON.load(rooms_response.to_s)['search_results']

    end

  end
end
