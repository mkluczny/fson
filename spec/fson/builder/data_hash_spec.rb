require 'spec_helper'

describe ::Fson::Response do

  context 'when adding hash data' do

    it 'should add given hash data' do
      # given
      data = {:id => 1}

      # when
      response = Fson::Response.success.data_hash(data)

      # then
      expect(response.instance_eval {_data}).to eq(data)
    end

    it 'should add given hash data and modify data in block' do
      # given
      data  = {:id => 1}
      code  = 200

      # when
      response = Fson::Response.success.data_hash(data) { |data|
        data[:code] = code
      }

      # then
      expect(response.instance_eval {_data}).to eq({:id => 1, :code => code})
    end

    it 'should raise an error if given data is not hash' do
      # given
      data = [1]

      # expect
      expect {

        # when
        Fson::Response.success.data_hash(data)

        # then
      }.to raise_error(RuntimeError, 'Invalid Argument Error')
    end

    it 'should raise an error if adding hash data to response with array data' do
      # expect
      expect {

        # when
        Fson::Response.success.data_array([]).data_hash({})

        # then
      }.to raise_error(RuntimeError, 'Invalid State Error: response data already initialized as an Array')
    end
  end
end