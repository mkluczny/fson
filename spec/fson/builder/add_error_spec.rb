require 'spec_helper'

describe ::Fson::Response do

  context 'when adding response errors' do

    it 'should add error messages' do
      # given
      error_1 = 'error message 1'
      error_2 = 'error message 2'

      # when
      response = Fson::Response.error.add_error(error_1).add_error(error_2)

      # then
      expect(response.instance_eval { _errors }).to contain_exactly({:message => error_1}, {:message => error_2})
    end

    it 'should add error message and add error attributes' do
      # given
      error = 'error message'
      code  = 401

      # when
      response = Fson::Response.error.add_error(error) {|e| e[:code] = code}

      # then
      expect(response.instance_eval { _errors }).to contain_exactly({:message => error, :code => code})
    end
  end
end