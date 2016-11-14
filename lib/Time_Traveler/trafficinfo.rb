require_relative 'google_api'

module Google
  class TrafficInfo
    attr_reader :infos
    attr_reader :origins, :dest, :mode
    attr_reader :anaDistance, :anaDuration, :fare


    def initialize(distance,search)

      parseSearch(search)
      @googleapi = ENV['GOOGLE_API']
      @infos = distance.map{ |item|
        infos = info(item)
      }
      @info = distance[0]
    end

    def trafficAnaly
      @anaDistance = @info['distance']['value']
      @anaDuration = @info['duration']
      if(@info['fare'])
        @fare = @info['fare']
      end

      @info

    end

    def self.find(origins:,destinations:,mode:)
      distance_data = GoogleApi.distanceInfo(origins,destinations,mode)
      @search_info = {googleapi:ENV['GOOGLE_API'],originsVal:origins,destVal:destinations,modeVal:mode}
    #  @info = distance_data[0]
    #  print @info.to_s

      new(distance_data,@search_info)
    end

    private
    def parseSearch(sear)
      @origins = sear[:originsVal]
      @dest = sear[:destVal]
      @mode = sear[:modeVal]
    end

    def info(item)
      info = item

    end

  end
end
