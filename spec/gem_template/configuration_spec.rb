RSpec.describe GemTemplate::Configuration do
  before do
    GemTemplate.configure do |config|
      config.base_url = 'https://example.com'
      config.username = 'jon'
      config.password = 'Secret'
    end
  end

  context 'with configuration block' do
    it 'returns the correct base_url' do
      expect(GemTemplate.configuration.base_url)
        .to eq('https://example.com')
    end

    it 'returns the correct username' do
      expect(GemTemplate.configuration.username).to eq('jon')
    end

    it 'returns the correct password' do
      expect(GemTemplate.configuration.password).to eq('Secret')
    end
  end

  context 'without configuration block' do
    before do
      GemTemplate.reset
    end

    it 'raises a configuration error for base_url' do
      expect { GemTemplate.configuration.base_url }
        .to raise_error(GemTemplate::ConfigNotSet)
    end

    it 'raises a configuration error for username' do
      expect { GemTemplate.configuration.username }
        .to raise_error(GemTemplate::ConfigNotSet)
    end

    it 'raises a configuration error for password' do
      expect { GemTemplate.configuration.password }
        .to raise_error(GemTemplate::ConfigNotSet)
    end
  end

  context '#reset' do
    it 'resets configured values' do
      expect(GemTemplate.configuration.base_url)
        .to eq('https://example.com')
      expect(GemTemplate.configuration.username).to eq('jon')
      expect(GemTemplate.configuration.password).to eq('Secret')

      GemTemplate.reset
      expect { GemTemplate.configuration.base_url }
        .to raise_error(GemTemplate::ConfigNotSet)
      expect { GemTemplate.configuration.username }
        .to raise_error(GemTemplate::ConfigNotSet)
      expect { GemTemplate.configuration.password }
        .to raise_error(GemTemplate::ConfigNotSet)
    end
  end
end
