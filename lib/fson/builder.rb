module Fson
  module Builder

    ##
    # Builder Methods
    ##

    def data(data = nil, &block)
      @_data = []

      if data and data.is_a?(Array)
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
    # Status Setters
    ##

    def error
      status(:error)
    end

    def success
      status(:success)
    end

    def fail
      status(:fail)
    end
  end
end