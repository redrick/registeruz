module Registeruz
  module Api
    class BaseWhere
      THIRD = 2

      def initialize(params)
        @params = params.merge('zmenene-od': '1993-01-01')
      end

      def self.where(params)
        new(params).where
      end

      def where
        response = Request.get(endpoint, @params)
        body = JSON.parse(response.body)
        ::Registeruz::Models::Collection.new(body, namespace_name)
      end

      def endpoint
        raise NotImplementedError
      end

      def namespace_name
        self.class.to_s.split('::')[THIRD]
      end
    end
  end
end
