require 'spec_helper'

describe ::Fson::Response do

  it 'should create fail response' do
    # when
    response = Fson::Response.fail

    # then
    expect(response.instance_eval {@_response[:status]}).to eq(:fail)
  end
end