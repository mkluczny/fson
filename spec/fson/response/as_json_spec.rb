require 'spec_helper'

describe ::Fson::Response do

  context 'when getting json representation of response' do

    it 'should return json response' do
      # given
      response = ::Fson::Response.error
                     .add_error('invalid') { |e| e[:id] = 'text-set-1'}
                     .data { |data| data << {:author => 'Mateusz Kluczny'} }

      # when/then
      expect(response.as_json).to eq("{\"status\":\"error\",\"data\":[{\"author\":\"Mateusz Kluczny\"}],\"errors\":[{\"message\":\"invalid\",\"id\":\"text-set-1\"}]}")
    end
  end
end