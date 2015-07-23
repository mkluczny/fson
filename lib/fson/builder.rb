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

    def error(message, id = nil)
      @_errors << { :message => message }.tap {|error|
        if id.present?
          error[:id] = id
        end
      }
      self
    end
  end
end