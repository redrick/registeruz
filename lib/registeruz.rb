require 'net/http'
require 'json'
require 'time'

require 'registeruz/version'
require 'registeruz/subject'
require 'registeruz/financial_statement'
require 'registeruz/errors'

require 'registeruz/api/base_where'
require 'registeruz/api/base_find'
require 'registeruz/api/subject/where'
require 'registeruz/api/subject/find'
require 'registeruz/api/financial_statement/where'
require 'registeruz/api/financial_statement/find'
require 'registeruz/api/request'
require 'registeruz/api/codebook'

require 'registeruz/models/collection'
require 'registeruz/models/subject'
require 'registeruz/models/financial_statement'

module Registeruz
  class << self
    def base_url
      'http://www.registeruz.sk/cruz-public/api/'
    end
  end
end
