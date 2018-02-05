class CounterService
  def process_string(string)
    # split string to words
    # Assumptions:
    #   1. All words saved in db lowercase
    #   2. Only alphabetic chars are counted, other chars removed
      split_words = get_split_string(string)
    # count words
      words_hash = count_words(split_words)
    # save hash to db
      save_words(words_hash)
  end

  private

  def get_split_string(string)
    string.downcase!
    string.gsub!(/[^a-z\ ]/i,'')
    string.split
  end

  def count_words(words_array)
    words_hash = {}
    words_array.each do |word|
      words_hash.has_key?(word) ? words_hash[word]+=1 : words_hash[word] = 1
    end
    words_hash
  end

  def save_words(words_hash)
    words_hash.each do |name, count|
      existing_word = Word.find_by(name:name)
      existing_word.count += count.to_i unless existing_word.nil?
      existing_word = Word.new({name: name, count: count.to_i}) if existing_word.nil?
      existing_word.save!
    end
  end
end