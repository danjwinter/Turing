require_relative './braille_letters'
require_relative './braille_to_text'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class NightReaderTest < Minitest::Test
  include Dictionary
  def setup
    ARGV.pop
    night = FileReader.new
  end

  def test_it_can_split_string_at_new_line
    night = NightReader.new
    sliced_string = night.split_at_returns("The banana \nstand")
    assert_equal ["The banana ", "stand"], sliced_string
  end

  def test_it_moves_array_to_top_middle_bottom
    night = NightReader.new
    night.move_to_top_bottom_middle(["There", "is always", "money", "in the banana", "stand", " right"])
    assert_equal "Therein the banana", night.top
    assert_equal "is alwaysstand", night.middle
    assert_equal "money right", night.bottom
  end
end