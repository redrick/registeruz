module Registeruz
  module Api
    class Request
      def initialize(endpoint, params)
        @endpoint = endpoint
        @params = params
      end

      def self.get(endpoint, params = {})
        new(endpoint, params).get
      end

      def get
        net_http_get
      end

      protected

      def net_http_get
        uri = URI("#{Registeruz.base_url}#{@endpoint}")
        uri.query = URI.encode_www_form(@params)

        request = Net::HTTP::Get.new(uri)
        headers.each { |k, v| request[k] = v }

        Net::HTTP.start(uri.hostname, uri.port,
                        use_ssl: (uri.scheme == 'https')) do |http|
          http.request(request)
        end
      end

      def headers
        {
          'Accept-Encoding' => 'application/json',
          'Content-Type' => 'application/json'
        }
      end
    end
  end
end
