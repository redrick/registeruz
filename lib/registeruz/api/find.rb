module Registeruz
  module Api
    class Find
      def initialize(id)
        @id = id
      end

      def self.find(id)
        new(id).find
      end

      def find
        response = Request.get('uctovna-jednotka', id: @id)
        body = JSON.parse(response.body)
        ::Registeruz::Models::Subject.new(body)
      end
    end
  end
end
