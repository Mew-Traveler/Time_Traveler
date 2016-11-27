require 'http'

module Airbnb
  # Service for all Airbnb API calls
  class AirbnbApi
    #Setting the URL and parameters
    Airbnb_URL = 'https://api.airbnb.com/'
    API_VER = 'v2'
    Airbnb_API_URL = URI.join(Airbnb_URL, "#{API_VER}/")
    Search_URL = URI.join(Airbnb_API_URL, "search_results")
    Price_URL = URI.join(Airbnb_API_URL, "listings")

    def self.config=(credentials)
      @config ? @config.update(credentials) : @config = credentials
    end

    def self.config
      return @config if @config
      @config = { airbnb_id:  ENV['AIRBNB_API'] }
    end

    def self.rooms_info(location)
      rooms_response = HTTP.get(Search_URL,
        params: { client_id: config[:airbnb_id],
                  location: location
                })
      roomsinfo = JSON.load(rooms_response.to_s)['search_results']

    end

    # def self.findPrice(room_id)
    #   response = HTTP.get(Price_URL,
    #     params: { client_id: config[:airbnb_id],
    #               location: location
    #             })

  end
end
