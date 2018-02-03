RSpec.describe Registeruz::Api::Where do
  describe '.where' do
    it 'calls instance method' do
      request = double
      allow(Registeruz::Api::Where).to receive(:new).and_return(request)
      expect(request).to receive(:where)
      Registeruz::Api::Where.where(2)
    end
  end

  describe '#where' do
    it 'is able to reach out getting correct answer' do
      VCR.use_cassette 'requests/where' do
        @result = Registeruz::Api::Where.where(ico: '50826042')
      end

      expect(@result).to be_a(Registeruz::Models::Collection)
      expect(@result.items.count).to eq(1)
    end
  end
end
