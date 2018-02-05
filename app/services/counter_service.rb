class CounterService
  def process_string(string)
    # split string to words
    # Assumptions:
    #   1. All words saved in db lowercase
    #   2. Only alphabetic chars are counted, other chars removed
    string.to_s.downcase!
    split_words = StringService.new.get_split_string_only_alphabet(string)
    # count words
    words_service = WordsService.new
    words_hash = words_service.count_words(split_words)
    # save hash to db
    words_service.save_words(words_hash)
  end
end