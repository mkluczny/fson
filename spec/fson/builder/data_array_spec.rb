require 'spec_helper'

describe ::Fson::Response do

  context 'when adding array data' do

    it 'should add given array data' do
      # given
      data = [{:id => 1}]

      # when
      response = Fson::Response.success.data_array(data)

      # then
      expect(response.instance_eval {_data}).to eq(data)
    end

    it 'should add given array data and modify data in block' do
      # given
      entry_1 = {:id => 1}
      entry_2 = {:id => 2}

      # when
      response = Fson::Response.success.data_array([entry_1]) { |data|
        data << entry_2
      }

      # then
      expect(response.instance_eval {_data}).to eq([entry_1, entry_2])
    end

    it 'should raise an error if given data is not array' do
      # given
      data = {:id => 1}

      # expect
      expect {

        # when
        Fson::Response.success.data_array(data)

        # then
      }.to raise_error(RuntimeError, 'Invalid Argument Error')
    end

    it 'should raise an error if adding array data to response with hash data' do
      # expect
      expect {

        # when
        Fson::Response.success.data_hash({}).data_array([])

        # then
      }.to raise_error(RuntimeError, 'Invalid State Error: response data already initialized as a Hash')
    end
  end
end