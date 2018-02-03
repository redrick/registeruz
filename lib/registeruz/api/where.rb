module Registeruz
  module Api
    class Where
      def initialize(params)
        @params = params.merge('zmenene-od': '1993-01-01')
      end

      def self.where(params)
        new(params).where
      end

      def where
        response = Request.get('uctovne-jednotky', @params)
        body = JSON.parse(response.body)
        ::Registeruz::Models::Collection.new(body)
      end
    end
  end
end
