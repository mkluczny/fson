module Fson
  module Builder

    def data(data = nil, &block)
      if data
        @_data = data
      end

      yield(@_data) if block_given?
      self
    end

    def status(status)
      @_response[:status] = status
      self
    end

    def add_error(message, &block)
      error = { :message => message }

      yield(error) if block_given?

      @_errors << error

      self
    end

    ##
    # Status setters
    ##

    def error
      status('error')
    end

    def success
      status('success')
    end

    def fail
      status('fail')
    end
  end
end