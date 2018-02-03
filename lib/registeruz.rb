require 'net/http'
require 'json'
require 'time'

require 'registeruz/version'
require 'registeruz/subject'
require 'registeruz/errors'

require 'registeruz/api/request'
require 'registeruz/api/where'
require 'registeruz/api/find'
require 'registeruz/api/codebook'

require 'registeruz/models/collection'
require 'registeruz/models/subject'

module Registeruz
  class << self
    def base_url
      'http://www.registeruz.sk/cruz-public/api/'
    end
  end
end
