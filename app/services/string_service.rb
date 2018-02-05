class StringService
  def get_split_string_only_alphabet(string)
    string.gsub!(/[^a-z\ ]/i,'')
    string.split
  end
end