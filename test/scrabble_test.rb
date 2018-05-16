gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    scrabble = Scrabble.new
    assert_equal 8, scrabble.score("hello")
  end

  def test_it_can_score_empty_string
    scrabble = Scrabble.new
    assert_equal 0, scrabble.score("")
  end

  def test_it_can_score_nil
    scrabble = Scrabble.new
    assert_equal 0, scrabble.score(nil)
  end

  def test_it_can_score_with_letter_multipliers
    scrabble = Scrabble.new
    actual = scrabble.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 9, actual
  end

  def test_it_can_score_with_word_multiplier
    scrabble = Scrabble.new
    actual = scrabble.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 18, actual
  end

  def test_it_add_a_bonus_for_using_all_seven_letters
    scrabble = Scrabble.new
    actual = scrabble.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    assert_equal 58, actual
  end
end
