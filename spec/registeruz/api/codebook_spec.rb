RSpec.describe Registeruz::Api::Codebook do
  describe '.find' do
    it 'finds sk name for sk-nace' do
      VCR.use_cassette 'codebook/sk_nace' do
        @result = Registeruz::Api::Codebook
          .find('sk-nace', '01160')
      end

      expect(@result).to eq('Pestov.plodín na vlákno')
    end

    it 'finds sk name for pravne-formy' do
      VCR.use_cassette 'codebook/pravne_formy' do
        @result = Registeruz::Api::Codebook
          .find('pravne-formy', '101')
      end

      expect(@result).to eq('Živnostník')
    end

    it 'finds sk name for druhy-vlastnictva' do
      VCR.use_cassette 'codebook/druhy_vlastnictva' do
        @result = Registeruz::Api::Codebook
          .find('druhy-vlastnictva', '3')
      end

      expect(@result).to eq('Družstevné')
    end

    it 'finds sk name for velkosti-organizacie' do
      VCR.use_cassette 'codebook/velkosti_organizacie' do
        @result = Registeruz::Api::Codebook
          .find('velkosti-organizacie', '12')
      end

      expect(@result).to eq('50-99 zamestnancov')
    end

    it 'finds sk name for kraje' do
      VCR.use_cassette 'codebook/kraje' do
        @result = Registeruz::Api::Codebook
          .find('kraje', '5')
      end

      expect(@result).to eq('Žilinský kraj')
    end

    it 'finds sk name for okresy' do
      VCR.use_cassette 'codebook/okresy' do
        @result = Registeruz::Api::Codebook
          .find('okresy', '505')
      end

      expect(@result).to eq('Liptovský Mikuláš')
    end

    it 'finds sk name for sidla' do
      VCR.use_cassette 'codebook/sidla' do
        @result = Registeruz::Api::Codebook
          .find('sidla', '510262')
      end

      expect(@result).to eq('Liptovský Mikuláš')
    end
  end
end
