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
      room_id = item['listing']['id']
      room = {
        id: room_id,
        name: item['listing']['name'],
        # need to get price from airbnbAPI
        #  Basic Sample Request: 
        #   https://api.airbnb.com/v2/listings/5116458?client_id=3092nxybyb0otqw18e8nh5nty&_format=v1_legacy_for_p3
        address: item['listing']['public_address'],
        airbnb_link: "https://www.airbnb.com.tw/rooms/" + room_id.to_s,
        roomImg: item['listing']['picture_url'],
        bed: item['listing']['beds'],
        roomRank: item['listing']['star_rating']

      }
    end

    def searchVal(oriSearch)
      @location = oriSearch['locate']
      @airbnbapi = oriSearch['api']
    end

  end
end
