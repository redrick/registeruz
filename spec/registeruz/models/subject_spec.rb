RSpec.describe Registeruz::Models::Collection do
  describe '.new' do
    it 'loads subjects if ids present' do
      body = {
        'nazovUJ' => "UOL SK s.r.o.",
        'mesto' => "Bratislava - mestská časť Rača",
        'ulica' => "Karpatské námestie 10A",
        'psc' => "83106",
        'datumZalozenia' => "2017-04-12",
        'pravnaForma' => "112",
        'velkostOrganizacie' => "00",
        'druhVlastnictva' => "7",
        'kraj' => "1",
        'okres' => "103",
        'sidlo' => "529354",
        'zdrojDat' => "SUSR",
        'datumPoslednejUpravy' => "2017-11-03",
        'ico' => "50826042",
        'skNace' => "69200",
        'konsolidovana' => false,
        'id' => 1689373
      }

      VCR.use_cassette 'models/subject' do
        @result = Registeruz::Models::Subject.new(body)
      end

      VCR.use_cassette 'models/subject_additional' do
        expect(@result.id).to eq(1689373)
        expect(@result.city).to eq('Bratislava - mestská časť Rača')
        expect(@result.consolidated).to be_falsey
        expect(@result.data_origin).to eq('SUSR')
        expect(@result.dic).to be_nil
        expect(@result.district).to eq('Bratislava III')
        expect(@result.founded_at).to eq(Time.parse('2017-04-12'))
        expect(@result.ico).to eq('50826042')
        expect(@result.legal_form).to eq('Spol. s r. o.')
        expect(@result.name).to eq('UOL SK s.r.o.')
        expect(@result.organization_size).to eq('nezistený')
        expect(@result.ownership_type).to eq('Zahraničné')
        expect(@result.postal_code).to eq('83106')
        expect(@result.region).to eq('Bratislavský kraj')
        expect(@result.residence).to eq('Bratislava-Rača')
        expect(@result.sk_nace_code).to eq('Účtovnícke činnosti')
        expect(@result.street).to eq('Karpatské námestie 10A')
        expect(@result.updated_at).to eq(Time.parse('2017-11-03'))
      end
    end
  end
end


