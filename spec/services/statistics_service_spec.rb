require 'rails_helper'

describe 'Statistics Service Spec' do
  let!(:vadim_word) {FactoryGirl.create(:vadim)}

  it 'Returns the count of the word from the db' do
    subject = StatisticsService.new
    statistics = subject.get_statistics('Vadim')
    expect(statistics).to eq vadim_word.count
  end

  it 'Does not return the count of the word when CAPS are true' do
    subject = StatisticsService.new
    statistics = subject.get_statistics('Vadim', false)
    expect(statistics).to eq 0
  end
end