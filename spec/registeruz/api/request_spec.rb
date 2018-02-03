RSpec.describe Registeruz::Api::Request do
  describe '.get' do
    it 'calls instance method' do
      request = double
      allow(Registeruz::Api::Request).to receive(:new).and_return(request)
      expect(request).to receive(:get)
      Registeruz::Api::Request.get('test', {})
    end
  end

  describe '#get' do
    it 'is able to reach out getting any answer' do
      VCR.use_cassette 'requests/request_get' do
        @result = Registeruz::Api::Request.get('test', {})
      end

      expect(@result.code).to eq('404')
    end
  end
end
