module Fson
  class Response

    include ::Fson::Builder

    ##
    # Constructor
    ##

    def initialize(status)
      @_response = {
          :status => status
      }
      @_data     = {}
      @_errors   = []
    end

    def to_json(options = nil)
      @_response.to_json(options)
    end

    class << self

      ##
      # Factory Methods
      ##

      def success
        ::Fson::Response.new(:success)
      end

      def error
        ::Fson::Response.new(:error)
      end

      def fail
        ::Fson::Response.new(:fail)
      end
    end

    ##
    # Private
    ##

    private

    def build
      unless @_data.empty?
        @_response[:body] = @_data
      end

      unless @_errors.empty?
        @_response[:errors] = @_errors
      end

      @_response
    end
  end
end