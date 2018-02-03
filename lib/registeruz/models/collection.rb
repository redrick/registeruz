module Registeruz
  module Models
    class Collection
      attr_accessor :items

      def initialize(body)
        raise NotFound unless body['id']&.any?
        @ids = body['id']
        load_all_subjects
      end

      private

      def load_all_subjects
        @items = @ids.map do |id|
          ::Registeruz::Api::Find.find(id)
        end
      end
    end
  end
end
