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

    it 'returns whole collection hash if without ID' do
      VCR.use_cassette 'codebook/druhy_vlastnictva_full' do
        @result = Registeruz::Api::Codebook
          .find('druhy-vlastnictva')
      end

      expect(@result).to eq([
        {"kod"=>"0", "nazov"=>{"sk"=>"Zatiaľ nezistené", "en"=>"Not ascertained yet"}},
        {"kod"=>"1", "nazov"=>{"sk"=>"Medzinárodné - verejné", "en"=>"Internatonial-public"}},
        {"kod"=>"2", "nazov"=>{"sk"=>"Súkromné tuzemské", "en"=>"Private inland"}},
        {"kod"=>"3", "nazov"=>{"sk"=>"Družstevné", "en"=>"Cooperative-owned"}},
        {"kod"=>"4", "nazov"=>{"sk"=>"Štátne", "en"=>"State-owned"}},
        {"kod"=>"5", "nazov"=>{"sk"=>"Vlast.územnej samosprávy", "en"=>"Municipality-owned"}},
        {"kod"=>"6", "nazov"=>{"sk"=>"Združ.,p.strany,cirkvi", "en"=>"Ownership of associat."}},
        {"kod"=>"7", "nazov"=>{"sk"=>"Zahraničné", "en"=>"Foreign"}},
        {"kod"=>"8", "nazov"=>{"sk"=>"Medzinárodné - súkromné", "en"=>"International-private"}},
        {"kod"=>"9", "nazov"=>{"sk"=>"Zmiešané", "en"=>"Mixed"}}
      ])
    end
  end
end
