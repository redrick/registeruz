module Registeruz
  class Error < StandardError; end

  class NotFound < Error
    def initialize
      msg = 'Could not find what you are looking for'
      super(msg)
    end
  end
end
