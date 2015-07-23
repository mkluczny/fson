require 'spec_helper'

describe ::Fson::Response do

  context 'when creating response' do

    it 'should create success response' do
      # when
      response = Fson::Response.success

      # then
      expect(response.instance_eval {@_response[:status]}).to eq(:success)
    end
  end
end