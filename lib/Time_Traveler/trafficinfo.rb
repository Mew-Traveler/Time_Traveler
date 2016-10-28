require_relative 'google_api'

module Google
  class TrafficInfo
    attr_reader :infos
    attr_reader :origins, :dest, :mode


    def initialize(distance,search)
      parseSearch(search)
      @googleapi = ENV['GOOGLE_API']
      @infos = distance.map{ |item|
        infos = info(item)
      }
    end

    def trafficAnaly
      @infos
    end

    def self.find(origins:,destinations:,mode:)
      distance_data = GoogleApi.distanceInfo(origins,destinations,mode)
      @search_info = {googleapi:ENV['GOOGLE_API'],originsVal:origins,destVal:destinations,modeVal:mode}
      new(distance_data,@search_info)
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
