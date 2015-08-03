module Fson
  module Builder

    ##
    # Builder Methods
    ##

    def data_hash(data = nil, &block)
      data(data, Hash, &block)
    end

    def data_array(data = nil, &block)
      data(data, Array, &block)
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

    def data(data = nil, type = nil, &block)
      self.send("_initialized_data_#{type.to_s.downcase}")

      if data
        raise 'Invalid Argument Error' unless data.is_a?(type)
        @_data = data
      end

      yield(@_data) if block_given?
      self
    end

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
      if @_data.is_a?(Hash)
        raise 'Invalid State Error: response data already initialized as a Hash'
      end

      @_data ||= []
    end

    def _initialized_data_hash
      if @_data.is_a?(Array)
        raise 'Invalid State Error: response data already initialized as an Array'
      end

      @_data ||= {}
    end
  end
end