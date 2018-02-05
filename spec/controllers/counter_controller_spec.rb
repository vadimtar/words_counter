require 'rails_helper'

describe CounterController do
  describe 'create' do
    it 'should Return OK' do
      response = xhr :post, :create, {string: 'This is a test string'}
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'text/plain'
      expect(response.body).to eq 'OK'
    end
  end
  describe 'create_from_file' do
    it 'should Return OK' do
      response = xhr :post, :create_from_file, {file: 'This is a test file'}
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'text/plain'
      expect(response.body).to eq 'OK'
    end
  end

end