require 'spec_helper'

describe ::Fson::Response do

  context 'when creating response' do

    it 'should create error response' do
      # when
      response = Fson::Response.error

      # then
      expect(response.instance_eval {@_response[:status]}).to eq(:error)
    end
  end
end