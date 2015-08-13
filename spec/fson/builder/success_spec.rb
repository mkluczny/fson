require 'spec_helper'

describe ::Fson::Response do

  context 'when setting response status' do

    it 'should set success status' do
      # when
      response = Fson::Response.error.success

      # then
      expect(response.instance_eval {@_response[:status]}).to eq(:success)
    end
  end
end