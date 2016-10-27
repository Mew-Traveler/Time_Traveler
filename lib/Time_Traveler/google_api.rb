require 'http'

module Google
  # Service for all Google API calls
  class GoogleApi
    #Setting the URL and parameters
    Google_URL = 'https://maps.googleapis.com/maps/api/'
    Search_Type = 'distancematrix'
    Return_Type = 'json'
    # Parms = '?location=-33.8670,151.1957&radius=500&types=food&name=cruise'
    Google_API_URL = URI.join(Google_URL, "#{Search_Type}/", "#{Return_Type}")
    #Search_URL = URI.join(Google_API_URL, "#{Parms}")
    attr_reader :google_data

    def initialize(googlemap_id:)
        @googlemap_id = googlemap_id
    end

    def self.analysis(posting_id)
     fb_resource(posting_id)
    end

    def distanceInfo(origins, dest, mode)
      return @distance if @distance
      distanceDetail = HTTP.get(Google_API_URL,
        params:
        {
          key: @googlemap_id,
          origins: origins,
          destinations: dest,
          mode: mode
        })
      distance_data = JSON.load(distanceDetail.to_s)['rows'][0]['elements']
    end

  end
end
