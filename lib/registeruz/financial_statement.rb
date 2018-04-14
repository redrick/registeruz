module Registeruz
  class FinancialStatement
    class << self
      def where(options)
        ::Registeruz::Api::FinancialStatement::Where.where(options).items
      end

      def find(id)
        ::Registeruz::Api::FinancialStatement::Find.find(id)
      end
    end
  end
end
