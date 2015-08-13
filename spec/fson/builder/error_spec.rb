require 'spec_helper'

describe ::Fson::Response do

  context 'when setting response status' do

    it 'should set error status' do
      # when
      response = Fson::Response.new.error

      # then
      expect(response.instance_eval {@_response[:status]}).to eq(:error)
    end
  end
end