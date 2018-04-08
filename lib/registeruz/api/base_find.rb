module Registeruz
  module Api
    class BaseFind
      THIRD = 2

      def initialize(id)
        @id = id
      end

      def self.find(id)
        new(id).find
      end

      def find
        response = Request.get(endpoint, id: @id)
        body = JSON.parse(response.body)
        model_class.new(body)
      end

      def namespace_name
        self.class.to_s.split('::')[THIRD]
      end

      def endpoint
        raise NotImplementedError
      end

      def model_class
        Object.const_get("::Registeruz::Models::#{namespace_name}")
      end
    end
  end
end
