require 'http'

module Skyscanner
  class SkyscannerApi
    Skyscanner_URL = 'http://partners.api.skyscanner.net/apiservices/browseroutes/'
    API_VER = 'v1.0'
    Skyscanner_API_URL = URI.join(Skyscanner_URL, "#{API_VER}/")

    def self.config=(credentials)
      @config ? @config.update(credentials) : @config = credentials
    end

    def self.config
      return @config if @config
      @config = { skyscanner_id:  ENV['SKYSCANNER_API'] }
    end

    def self.getOriginData(market, currency, locale, originPlace, destinationPlace, outboundPartialDate)
      url = URI.join(Skyscanner_API_URL, market+"/", currency+"/", locale+"/", originPlace+"/", destinationPlace+"/", outboundPartialDate);
      skyscanner_response = HTTP.get(url,
        params: {
        apiKey: config[:skyscanner_id]
        })
        print skyscanner_response
        originData = JSON.load(skyscanner_response.to_s)
    end
  end
end
