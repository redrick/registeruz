RSpec.describe Registeruz::Models::FinancialStatement do
  describe '.new' do
    it 'loads financial_statement if id present' do
      VCR.use_cassette 'models/financial_statement/object' do
        @result = Registeruz::FinancialStatement.find('1')
      end

      expect(@result.accounting_report_ids).to contain_exactly(1, 2)
      expect(@result.assembled_for_date).to eq(Time.parse('2009-12-31 00:00:00 +0100'))
      expect(@result.comprehensiver_finstat_of_public_admin).to be_nil
      expect(@result.consolidated).to be_truthy
      expect(@result.consolidated_check_of_central_gov).to be_nil
      expect(@result.data_origin).to eq('JUS')
      expect(@result.dic).to be_nil
      expect(@result.fond_name).to be_nil
      expect(@result.ico).to eq('30845572')
      expect(@result.id).to eq(1)
      expect(@result.lei_code).to be_nil
      expect(@result.period_from).to eq(Time.parse('2009-01-01 00:00:00 +0100'))
      expect(@result.period_to).to eq(Time.parse('2009-12-01 00:00:00 +0100'))
      expect(@result.subject_id).to eq(442175)
      expect(@result.subject_name).to eq('Ministerstvo obrany Slovenskej republiky')
      expect(@result.type).to eq('Riadna')
      expect(@result.updated_at).to eq(Time.parse('2013-08-18 00:00:00 +0200'))
    end

    it 'loads additional financial_statement info' do
      body = {
        'idUctovnychVykazov': [1, 2],
        'datumZostavenia' => '2009-12-31 00:00:00 +0100',
        'datumPrilozeniaSpravyAuditora' => nil,
        'konsolidovana' => true,
        'konsolidovanaZavierkaUstrednejStatnejSpravy' => nil,
        'zdrojDat' => 'JUS',
        'dic' => nil,
        'nazovFondu' => nil,
        'ico' => '30845572',
        'id' => 1,
        'leiKod' => nil,
        'obdobieOd' => '2009-01-01 00:00:00 +0100',
        'obdobieDo' => '2009-12-01 00:00:00 +0100',
        'idUJ' => 442175,
        'nazovUJ' => 'Ministerstvo obrany Slovenskej republiky',
        'typ' => 'Riadna',
        'datumPoslednejUpravy' => '2013-08-18 00:00:00 +0200'
      }

      @result = Registeruz::Models::FinancialStatement.new(body)

      VCR.use_cassette 'models/financial_statement/additional' do
        expect(@result.subject.name).to eq('Ministerstvo obrany Slovenskej republiky')
      end
    end
  end
end


