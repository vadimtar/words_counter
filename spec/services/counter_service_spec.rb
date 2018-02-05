require 'rails_helper'

describe 'Counter Service Spec' do
  it 'Counts words and saves them to the database' do
    subject = CounterService.new
    string = 'I need your clothes, boots and your motorcycle'
    subject.process_string(string)
    your = Word.find_by(name: 'your')
    motorcycle = Word.find_by(name: 'motorcycle')

    expect(your.count).to eq 2
    expect(motorcycle.count).to eq 1
  end
end