module Registeruz
  class FinancialStatement
    class << self
      def where(options)
        ::Registeruz::Api::FinancialStatement::Where.where(options).items
      end

      def find_by(options)
        where(options).first
      end

      def find(id)
        ::Registeruz::Api::FinancialStatement::Find.find(id)
      end
    end
  end
end
