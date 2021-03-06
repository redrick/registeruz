module Registeruz
  class Subject
    class << self
      def where(options)
        ::Registeruz::Api::Subject::Where.where(options).items
      end

      def find_by(options)
        where(options).first
      end

      def find(id)
        ::Registeruz::Api::Subject::Find.find(id)
      end
    end
  end
end
