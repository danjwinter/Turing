require_relative './braille_letters'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class NightWriterTest < Minitest::Test
  def setup
    ARGV.pop
  end

  def test_it_can_read_file
    ARGV << "sample.txt"
    night = FileReader.new.read
    assert_equal night.string, "This is your first sample.\n"
  end


  def test_it_can_chunk_40_characters
    ARGV << "sample2.txt"
    night = FileReader.new.read
    assert_equal night.chunk_from_alphabet, ""
  end
end
