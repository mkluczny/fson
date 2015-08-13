require 'spec_helper'

describe ::Fson::Response do

  context 'when setting response status' do

    it 'should set fail status' do
      # when
      response = Fson::Response.new.fail

      # then
      expect(response.instance_eval {@_response[:status]}).to eq(:fail)
    end
  end
end