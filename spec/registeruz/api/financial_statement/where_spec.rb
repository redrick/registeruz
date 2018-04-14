RSpec.describe Registeruz::Api::FinancialStatement::Where do
  describe '.where' do
    it 'calls instance method' do
      request = double
      allow(Registeruz::Api::FinancialStatement::Where).to receive(:new).and_return(request)
      expect(request).to receive(:where)
      Registeruz::Api::FinancialStatement::Where.where(2)
    end
  end

  describe '#where' do
    it 'is able to reach out getting correct answer' do
      VCR.use_cassette 'requests/financial_statement/where' do
        @result = Registeruz::Api::FinancialStatement::Where.where('max-zaznamov': 2)
      end

      expect(@result).to be_a(Registeruz::Models::Collection)
      expect(@result.items.count).to eq(2)
    end
  end
end
