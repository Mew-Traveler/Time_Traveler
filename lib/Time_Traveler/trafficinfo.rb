require_relative 'google_api'

module Google
  class TrafficInfo
    attr_reader :infos
    attr_reader :origins, :dest, :mode


    def initialize(google_api,distance,search)
      parseSearch(search)
      @googleapi = google_api
      @infos = distance.map{ |item|
        infos = info(item)
      }
    end

    def trafficAnaly
      @infos
    end

    def self.find(google_api:,origins:,destinations:,mode:)
      distance_data = google_api.distanceInfo(origins,destinations,mode)
      @search_info = {originsVal:origins,destVal:destinations,modeVal:mode}
      new(google_api,distance_data,@search_info)
    end

    private
    def parseSearch(sear)
      @origins = sear['originsVal']
      @dest = sear['destVal']
      @mode = sear['modeVal']
    end

    def info(item)
      info = item[0]
    end

  end
end
