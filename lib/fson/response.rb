require 'oj'

module Fson

  require_relative 'builder'

  class Response

    include ::Fson::Builder

    ##
    # Constructor
    ##

    def initialize(status = nil)
      @_response = {}
      @_data     = []
      @_errors   = []

      unless status.nil?
        @_response[:status] = status
      end
    end

    def as_json
      ::Oj.dump(build, :mode => :compat)
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
        @_response[:data] = @_data
      end

      unless @_errors.empty?
        @_response[:errors] = @_errors
      end

      @_response
    end
  end
end