require 'rails_helper'

describe StatisticsController do
  describe 'show' do
    it 'should Return JSON empty name and 0' do
      response = xhr :get, :show, {non_existing_key: 'Test'}
      expected = {'Result': {'Name': '', 'Count': 0}}
      expect(response.body).to eq expected.to_json
    end
    it 'should Return JSON with same name and 0' do
      name = 'Test'
      response = xhr :get, :show, {id: name}
      expected = {'Result': {'Name': name, 'Count': 0}}
      expect(response.body).to eq expected.to_json
    end
  end
end