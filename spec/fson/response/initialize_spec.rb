require 'spec_helper'

describe ::Fson::Response do

  context 'when creating response' do

    it 'should create response object with given status' do
      # when
      response = Fson::Response.new(:success)

      # then
      expect(response.instance_eval {@_response[:status]}).to eq(:success)
    end
  end
end