require 'rails_helper'

describe 'Words Service Spec' do
  it 'saves words to the database' do
    subject = WordsService.new
    words_hash = {'your': 2, 'motorcycle': 1 }
    subject.save_words(words_hash)
    your = Word.find_by(name: 'your')
    motorcycle = Word.find_by(name: 'motorcycle')

    expect(your.count).to eq 2
    expect(motorcycle.count).to eq 1
  end
  it 'counts words correctly and returns hash with results' do
    words_array = ['I', 'Love', 'Yeruham', 'and', 'I', 'love', 'Dimona']
    subject = WordsService.new
    response = subject.count_words(words_array)
    expected = {
        'I' => 2,
        'Love' => 1,
        'Yeruham' => 1,
        'and' => 1,
        'love' => 1,
        'Dimona' => 1
    }
    expect(response).to eq expected
  end
end