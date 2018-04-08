module Registeruz
  module Models
    class Collection
      attr_accessor :items

      def initialize(body, namespace_name)
        raise NotFound unless body['id']&.any?
        @ids = body['id']
        @namespace_name = namespace_name
        load_all_subjects
      end

      private

      def load_all_subjects
        @items = @ids.map do |id|
          finder_class.find(id)
        end
      end

      def finder_class
        Object.const_get("::Registeruz::Api::#{@namespace_name}::Find")
      end
    end
  end
end
