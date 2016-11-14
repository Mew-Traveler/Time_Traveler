require_relative 'google_api_inter'

module Google
  class GooglePlaceRating
    # attr_reader :query
    attr_reader :rating_rawdata

    def initialize(data,input)
      @googleapi = ENV['GOOGLE_API']
      @queryVal = input[0]
      rating_analysis(data)
    end

    def self.find(query:)
      rating_rawdata = InternalGoogleApi.this_rating(query)
      @queryRating_input = {googleapi:ENV['GOOGLE_API'],queryKey:query}

      new(rating_rawdata,@queryRating_input)
    end

    private
    def rating_analysis(queryresult)
      queryresult.map do |place|
        @rating = place['rating']
        @lat = place['geometry']['location']['lat']
        @lng = place['geometry']['location']['lng']
        @placeid = place['place_id']
        @types = place['types']
        @address = place['formatted_address']
        @placename = place['name']
        # @rating = queryresult[0]['rating']
        # @lat = queryresult[0]['geometry']['location']['lat']
        # @lng = queryresult[0]['geometry']['location']['lng']
      end
    end
  end
end
