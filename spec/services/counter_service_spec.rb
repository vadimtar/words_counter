require 'rails_helper'

describe 'Counter Service Spec' do
  let!(:subject) {CounterService.new}

  it 'Counts words and saves them to the db' do
    string = 'I need your clothes, boots and your motorcycle'
    subject.process_string(string)
    your = Word.find_by(name: 'your')
    motorcycle = Word.find_by(name: 'motorcycle')

    expect(your.count).to eq 2
    expect(motorcycle.count).to eq 1
  end

  it 'Add count when adding existing words to the db' do
    motorcycle_word = FactoryGirl.create(:motorcycle)
    your_word = FactoryGirl.create(:your)
    string = 'I need your clothes, boots and your motorcycle'
    subject.process_string(string)
    your = Word.find_by(name: 'your')
    motorcycle = Word.find_by(name: 'motorcycle')

    expect(your.count).to eq (your_word.count + 2)
    expect(motorcycle.count).to eq (motorcycle_word.count + 1)
  end
end