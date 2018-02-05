require 'rails_helper'

describe 'String Service Spec' do
  it 'splits string and removes all non alphabetical chars' do
    subject = StringService.new
    string = 'Hey121212(***$))) hello === dear1*'
    split_string = subject.get_split_string_only_alphabet(string)
    expected_string = ['Hey', 'hello', 'dear']
    expect(split_string).to eq expected_string
  end
end