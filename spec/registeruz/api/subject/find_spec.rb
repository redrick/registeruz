RSpec.describe Registeruz::Api::Subject::Find do
  describe '.find' do
    it 'calls instance method' do
      request = double
      allow(Registeruz::Api::Subject::Find).to receive(:new).and_return(request)
      expect(request).to receive(:find)
      Registeruz::Api::Subject::Find.find(2)
    end
  end

  describe '#find' do
    it 'is able to reach out getting correct answer' do
      VCR.use_cassette 'requests/find' do
        @result = Registeruz::Api::Subject::Find.find('1689373')
      end

      expect(@result).to be_a(Registeruz::Models::Subject)
      expect(@result.name).to eq('UOL SK s.r.o.')
    end
  end
end
