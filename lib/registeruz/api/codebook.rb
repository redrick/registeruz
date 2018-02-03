module Registeruz
  module Api
    class Codebook
      def initialize(codebook_name, code)
        @codebook_name = codebook_name
        @code = code
      end

      def self.find(codebook_name, code)
        new(codebook_name, code).find
      end

      def find
        response = Request.get(@codebook_name)
        body = JSON.parse(response.body)
        body[body.keys.first].select do |item|
          item['kod'] == @code
        end.first['nazov']['sk']
      end
    end
  end
end
