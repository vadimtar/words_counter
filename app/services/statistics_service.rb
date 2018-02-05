class StatisticsService
  def get_statistics(word)
    word = Word.find_by(name: word.downcase)
    word.nil? ? 0 : word.count
  end
end