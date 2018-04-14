RSpec.describe Registeruz::FinancialStatement do
  describe '.where' do
    it 'returns array of results' do
      VCR.use_cassette 'financial_statement/where_success' do
        @result = Registeruz::FinancialStatement.where('max-zaznamov': 2)
      end

      expect(@result).to be_a(Array)
      expect(@result.count).to eq(2)
      expect(@result.first).to be_a(Registeruz::Models::FinancialStatement)
    end
  end

  describe '.find' do
    it 'returns object you are looking for' do
      VCR.use_cassette 'financial_statement/find_success' do
        @result = Registeruz::FinancialStatement.find(1)
      end

      expect(@result).to be_a(Registeruz::Models::FinancialStatement)
      expect(@result.id).to eq(1)
    end

    it 'raises if not found' do
      expect do
        VCR.use_cassette 'financial_statement/find_fail' do
          @result = Registeruz::FinancialStatement.find(0)
        end
      end.to raise_error { Registeruz::NotFound }
    end
  end
end
