require 'rails_helper'

describe CounterController do
  describe 'show' do
    it 'should Return JSON with 0' do
      response = xhr :get, :show, {string: 'Test'}
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'text/plain'
      expect(response.body).to eq 'OK'
    end
  end
end