class Scrabble

  def score(word)
    return 0 if word.nil?
    letter_multipliers = []
    word.length.times do
      letter_multipliers << 1
    end
    score_with_multipliers(word, letter_multipliers)
  end

  def score_with_multipliers(word, letter_multipliers, word_multiplier = 1)
    score = []
    # word.length.times do |index|
    #   score << (point_values[word[index].upcase] * letter_multipliers[index])
    # end
    score = get_chars(word).map.with_index do |letter, index|
      point_values[letter] * letter_multipliers[index]
    end
    score = score.sum
    if word.length >= 7
      score += 10
    end
    score * word_multiplier
  end

  def get_chars(word)
    word.upcase.chars
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
