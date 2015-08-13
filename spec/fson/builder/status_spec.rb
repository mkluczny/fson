require 'spec_helper'

describe ::Fson::Response do

  context 'when setting response status' do

    it 'should set status' do
      # when
      response = Fson::Response.new.status(:custom)

      # then
      expect(response.instance_eval {@_response[:status]}).to eq(:custom)
    end
  end
end