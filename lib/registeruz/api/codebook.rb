module Registeruz
  module Api
    class Codebook
      def initialize(codebook_name, code)
        @codebook_name = codebook_name
        @code = code
      end

      def self.find(codebook_name, code = nil)
        new(codebook_name, code).find
      end

      # rubocop:disable Metrics/AbcSize
      def find
        response = Request.get(@codebook_name)
        body = JSON.parse(response.body)
        if @code
          body[body.keys.first].select do |item|
            item['kod'] == @code
          end.first['nazov']['sk']
        else
          body[body.keys.first]
        end
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
