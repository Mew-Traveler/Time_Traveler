require_relative 'airbnb_api'

module Airbnb
  class RentInfo
    attr_reader :location
    attr_reader :infos

    def initialize(rooms,info)
      @infos = rooms.map { |item|
        rooms = room(item)
      }
      searchVal(info)
    end

    def infos
      @infos
    end

    def self.find(location:)
      @search_info = {api:ENV['AIRBNB_API'],locate:location}
      rooms_data = AirbnbApi.rooms_info(location)
      new(rooms_data,@search_info)
    end

    private
    def room(item)
      #item = item['listing']
      room = {
        city: item['listing']['city'],
        name: item['listing']['name'],
        pic_url: item['listing']['picture_url'],
        id: item['listing']['id']
      }
    end

    def searchVal(oriSearch)
      @loacation = oriSearch['locate']
      @airbnbapi = oriSearch['api']
    end

  end
end
