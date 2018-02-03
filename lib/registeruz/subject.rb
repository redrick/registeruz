module Registeruz
  class Subject
    class << self
      def where(options)
        ::Registeruz::Api::Where.where(options).items
      end

      def find_by(options)
        where(options).first
      end
    end
  end
end
