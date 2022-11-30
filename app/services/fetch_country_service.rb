require 'net/http'

class FetchCountryService
  attr_reader :ip

  def initialize(ip)
    @ip = ip
  end

  def perform
    uri = URI("http://ip-api.com/json/#{ip}")
    response = Net::HTTP.get(uri)
    parsedResponse = JSON.parse(response)
    status = parsedResponse.dig('status')
    parsedResponse.dig('countryCode').downcase if status == 'success'
  rescue StandardError
    nil
  end
end
