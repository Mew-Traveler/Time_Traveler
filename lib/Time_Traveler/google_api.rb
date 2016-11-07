require 'http'

module Google
  # Service for all Google API calls
  class GoogleApi
    #Setting the URL and parameters
    Google_URL = 'https://maps.googleapis.com/maps/api/'
    Search_Type = 'distancematrix'
    Return_Type = 'json'
    Google_API_URL = URI.join(Google_URL, "#{Search_Type}/", "#{Return_Type}")
    #Search_URL = URI.join(Google_API_URL, "#{Parms}")
    attr_reader :google_data

    def self.config=(credentials)
      @config ? @config.update(credentials) : @config = credentials
    end

    def self.config
      return @config if @config
      @config = { googlemap_id: ENV['GOOGLE_API'] }
    end

    def self.distanceInfo(origins, dest, mode)
      return @distance if @distance
      distanceDetail = HTTP.get(Google_API_URL,
        params:
        {
          key: config['googlemap_id'],
          origins: origins,
          destinations: dest,
          mode: mode
        })
      distance_data = JSON.load(distanceDetail.to_s)['rows'][0]['elements']
    end

  end
end
