RSpec.describe Registeruz::Api::FinancialStatement::Find do
  describe '.find' do
    it 'calls instance method' do
      request = double
      allow(Registeruz::Api::FinancialStatement::Find).to receive(:new).and_return(request)
      expect(request).to receive(:find)
      Registeruz::Api::FinancialStatement::Find.find(2)
    end
  end

  describe '#find' do
    it 'is able to reach out getting correct answer' do
      VCR.use_cassette 'requests/financial_statement/find' do
        @result = Registeruz::Api::FinancialStatement::Find.find('1')
      end

      expect(@result).to be_a(Registeruz::Models::FinancialStatement)
      expect(@result.ico).to eq('30845572')
    end
  end
end
