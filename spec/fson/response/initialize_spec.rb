require 'spec_helper'

describe ::Fson::Response do

  it 'should create response object with status assigned' do
    # when
    response = Fson::Response.new(:success)

    # then
    expect(response.instance_eval {@_response[:status]}).to eq(:success)
  end
end