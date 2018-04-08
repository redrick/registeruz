RSpec.describe Registeruz::Models::Collection do
  describe '.new' do
    it 'loads subjects if ids present' do
      body = {
        'id' => [1, 2, 3]
      }

      expect(Registeruz::Api::Subject::Find).to receive(:find).exactly(3).times
      Registeruz::Models::Collection.new(body, 'Subject')
    end

    it 'loads subjects if ids present' do
      body = {
        'id' => [1, 2, 3]
      }

      expect(Registeruz::Api::FinancialStatement::Find).to receive(:find).exactly(3).times
      Registeruz::Models::Collection.new(body, 'FinancialStatement')
    end

    it 'raises NotFound if nothing present' do
      body = {}

      expect do
        Registeruz::Models::Collection.new(body)
      end.to raise_error { Registeruz::NotFound }
    end
  end
end
