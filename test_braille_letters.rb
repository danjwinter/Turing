require_relative './braille_letters'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class NightWriterTest < Minitest::Test
  def test_it_can_read_file
    night = NightWriter.new
    assert_equal night.string, "TEST TEST TEST"
  end
end
