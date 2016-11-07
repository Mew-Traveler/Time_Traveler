require_relative 'skyscanner_api'

module Skyscanner
	class FlightInfo
		attr_reader :flightInfo

		def initialize(originData)
			carrierId2Carrier = getCarrierId2Carrier(originData)
			placeId2Place = getPlaceId2Place(originData)
			@flightInfo = extractFlightInfo(carrierId2Carrier, placeId2Place, originData)
		end

		def flightInfo
			@flightInfo
		end

		def self.find(market:, currency:, locale:, originPlace:, destinationPlace:, outboundPartialDate:)
			puts market+currency+locale
			originData = SkyscannerApi.getOriginData(market, currency, locale, originPlace, destinationPlace, outboundPartialDate)
			new(originData)
		end

		private
		def getCarrierId2Carrier(originData)
			carriers = originData["Carriers"]
			carrierId2Carrier = Hash.new()
			carriers.each do |carrier|
				carrierId2Carrier[carrier["CarrierId"]] = carrier["Name"]
			end	
			carrierId2Carrier		
		end

		private
		def getPlaceId2Place(originData)
			places = originData["Places"]
			placeId2Place = Hash.new()
			places.each do |place|
				if place["Type"] == "Station"
					placeId2Place[place["PlaceId"]] = place["Name"] #+","+place["CountryName"]
				end
			end
			placeId2Place
		end

		private
		def extractFlightInfo(carrierId2Carrier, placeId2Place, originData)
			quotes = originData["Quotes"]
			quotes.each do |quote|
				if(quote["OutboundLeg"]["CarrierIds"].empty? == false)
					for i in 0..quote["OutboundLeg"]["CarrierIds"].length
						quote["OutboundLeg"]["CarrierIds"][i] = carrierId2Carrier[quote["OutboundLeg"]["CarrierIds"][i]]
					end
				end
				quote["OutboundLeg"]["OriginId"] = placeId2Place[quote["OutboundLeg"]["OriginId"]]
				quote["OutboundLeg"]["DestinationId"] = placeId2Place[quote["OutboundLeg"]["DestinationId"]]
			end
			quotes
		end		
	end
end