require 'http'
#search rating of places
module Google
  # Service for all Google API calls
  class InternalGoogleApi
    #Setting the URL and parameters
    Google_URL = 'https://maps.googleapis.com/maps/api/'
    Search_Type = 'place/textsearch'
    Return_Type = 'json'
    Google_API_URL = URI.join(Google_URL, "#{Search_Type}/", "#{Return_Type}")
    #Search_URL = URI.join(Google_API_URL, "#{Parms}")
    #https://maps.googleapis.com/maps/api/place/textsearch/xml?query=清華大學&key=AIzaSyADFcZbph8b9jvV5D9zgrlOm2oMQpv6krI
    attr_reader :google_data

    def self.config=(credentials)
      @config ? @config.update(credentials) : @config = credentials
    end

    def self.config
      return @config if @config
      @config = { googlemap_id: ENV['GOOGLE_API'] }
    end

    def self.this_rating(station)
      return @this_rating if @this_rating

      station_rating = HTTP.get(Google_API_URL,
        params:
        {
          key: 'AIzaSyADFcZbph8b9jvV5D9zgrlOm2oMQpv6krI',
          query: station
        })
        print station_rating
      this_station_rating = JSON.load(station_rating.to_s)['results']
    end

  end
end
