RSpec.describe Registeruz::Subject do
  describe '.where' do
    it 'returns array of results' do
      VCR.use_cassette 'subject/where_success' do
        @result = Registeruz::Subject.where(ico: 50826042)
      end

      expect(@result).to be_a(Array)
      expect(@result.count).to eq(1)
      expect(@result.first).to be_a(Registeruz::Models::Subject)
    end

    it 'raises if not found' do
      expect do
        VCR.use_cassette 'subject/where_fail' do
          @result = Registeruz::Subject.where(ico: 5082604)
        end
      end.to raise_error { Registeruz::NotFound }
    end
  end

  describe '.find_by' do
    it 'returns object you are looking for' do
      VCR.use_cassette 'subject/find_by_success' do
        @result = Registeruz::Subject.find_by(ico: 50826042)
      end

      expect(@result).to be_a(Registeruz::Models::Subject)
      expect(@result.id).to eq(1689373)
    end

    it 'raises if not found' do
      expect do
        VCR.use_cassette 'subject/find_by_fail' do
          @result = Registeruz::Subject.find_by(ico: 5082604)
        end
      end.to raise_error { Registeruz::NotFound }
    end
  end

  describe '.find' do
    it 'returns object you are looking for' do
      VCR.use_cassette 'subject/find_success' do
        @result = Registeruz::Subject.find(1689373)
      end

      expect(@result).to be_a(Registeruz::Models::Subject)
      expect(@result.id).to eq(1689373)
    end

    it 'raises if not found' do
      expect do
        VCR.use_cassette 'subject/find_fail' do
          @result = Registeruz::Subject.find(0)
        end
      end.to raise_error { Registeruz::NotFound }
    end
  end
end
