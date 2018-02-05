class WordsService
  def save_words(words_hash)
    words_hash.each do |name, count|
      existing_word = Word.find_by(name:name)
      existing_word.count += count.to_i unless existing_word.nil?
      existing_word = Word.new({name: name, count: count.to_i}) if existing_word.nil?
      existing_word.save!
    end
  end

  def count_words(words_array)
    words_hash = {}
    words_array.each do |word|
      words_hash.has_key?(word) ? words_hash[word]+=1 : words_hash[word] = 1
    end
    words_hash
  end
end