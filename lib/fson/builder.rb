module Fson
  module Builder

    ##
    # Builder Methods
    ##

    def data(data = nil, &block)
      _initialized_data_array

      if data and data.is_a?(Array)
        @_data = data
      end

      yield(_initialized_data_array()) if block_given?
      self
    end

    def status(status)
      _response[:status] = status
      self
    end

    def add_error(message, &block)
      error = { :message => message }

      yield(error) if block_given?

      _errors.push(error)
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

    ##
    # Private
    ##

    private

    def _data
      @_data
    end

    def _response
      @_response
    end

    def _errors
      @_errors
    end

    def _initialized_data_array
      @_data ||= []
    end
  end
end