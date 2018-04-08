module Registeruz
  module Api
    module FinancialStatement
      class Where < BaseWhere
        def endpoint
          'uctovne-zavierky'
        end
      end
    end
  end
end
