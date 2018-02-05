class StatisticsService
  def get_statistics(word, downcase = true)
    word = Word.find_by(name: downcase ? word.downcase : word)
    word.nil? ? 0 : word.count
  end
end