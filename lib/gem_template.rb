require 'gem_template/version'

require 'gem_template/configuration'
require 'gem_template/utils/errors'

module GemTemplate
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
