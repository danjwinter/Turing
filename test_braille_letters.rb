require_relative './braille_letters'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class NightWriterTest < Minitest::Test
  include Dictionary
  def setup
    ARGV.pop
    night = FileReader.new
  end

  def test_it_can_read_file
    night = NightWriter.new
    ARGV << "sample.txt"
    assert_equal night.reader.read, "this is your first sample. 768 lkj 2932 ld"
  end

  def test_letters_convert_to_braille
    night = NightWriter.new
    night.convert_non_digit_to_braille("pizza")
    assert_equal night.top, "00.00.0.0."
    assert_equal night.middle, "0.0..0.0.."
    assert_equal night.bottom, "0...0000.."
  end

  def test_punctuation_convert_to_braille
    night = NightWriter.new
    night.convert_non_digit_to_braille("!',-.?")
    assert_equal night.top, "............"
    assert_equal night.middle, "00..0...000."
    assert_equal night.bottom, "0.0...00.000"
  end

  def test_letters_and_punctuation_convert_to_braille
    night = NightWriter.new
    night.convert_non_digit_to_braille("pizza!?")
    assert_equal night.top, "00.00.0.0....."
    assert_equal night.middle, "0.0..0.0..000."
    assert_equal night.bottom, "0...0000..0.00"
  end

  def test_spaces_convert_to_braille_with_other_text
    night = NightWriter.new
    night.convert_non_digit_to_braille("pi za")
    assert_equal night.top, "00.0..0.0."
    assert_equal night.middle, "0.0....0.."
    assert_equal night.bottom, "0.....00.."
  end

  def test_spaced_letters_punctuation_convert_to_braille
    night = NightWriter.new
    night.convert_non_digit_to_braille("pi za!")
    assert_equal night.top, "00.0..0.0..."
    assert_equal night.middle, "0.0....0..00"
    assert_equal night.bottom, "0.....00..0."
  end

  def test_it_adds_shift_character_for_capital_letters
    night = NightWriter.new
    new_string = night.add_shift_for_capital_character("There's Always Money in the")
    assert_equal "`there's `always `money in the", new_string
  end

  def test_it_converts_letters_with_capitals_to_braille
    night = NightWriter.new
    shift_with_letters = night.add_shift_for_capital_character("The")
    night.convert_non_digit_to_braille(shift_with_letters)
    assert_equal night.top, "...00.0."
    assert_equal night.middle, "..0000.0"
    assert_equal night.bottom, ".00....."
  end

  def test_it_adds_number_trigger
    night = NightWriter.new
    new_string = night.add_number_trigger("there are 90 dollars and 10 bananas")
    assert_equal "there are #90 dollars and #10 bananas", new_string
  end

  def test_it_converts_numbers
  night = NightWriter.new
  num_trigger_with_string = night.add_number_trigger("911")
  night.convert_digit_to_braille(num_trigger_with_string)
  assert_equal night.top, ".0.00.0."
  assert_equal night.middle, ".00....."
  assert_equal night.bottom, "00......"
  end
end
