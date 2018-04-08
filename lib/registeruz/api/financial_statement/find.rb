module Registeruz
  module Api
    module FinancialStatement
      class Find < BaseFind
        def endpoint
          'uctovna-zavierka'
        end
      end
    end
  end
end
