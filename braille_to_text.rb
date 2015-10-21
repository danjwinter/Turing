#Braille to text
require_relative "braille_letters"

require 'pry'
class FileReader
  def read
    filename = ARGV[0]
    (File.read(filename))
  end
end

class NightReader
  include Dictionary
  attr_reader :reader, :string, :top, :middle, :bottom, :braille_key
  attr_writer :top, :bottom, :middle

  def initialize
    @reader = FileReader.new
    @top = ""
    @middle = ""
    @bottom = ""
  end

  def split_at_returns(string)
    string.split("\n")
  end

  def move_to_top_bottom_middle(array)
    until array.length == 0 do
      @top << array.shift
      @middle << array.shift
      @bottom << array.shift
    end
  end

  def slice_string_into_twos(string)
    sliced_string = string.scan(/.{2}/)
    sliced_string
  end

  def create_braille_key
    braille_keys = []
    @top.each_index do |i|
      braille_keys[i] = [top[i], middle[i], bottom[i]]
    end
    braille_keys
  end

  def create_letter_string(braille_keys)
    letter_string = ""
    braille_keys.each do |key|
      letter_string << BRAILLE_TO_ALPHABET[key]
    end
    letter_string
  end

  def convert_to_numbers_from_trigger(string)
    string.delete!("#")
    num = ""
    string.each_char do |char|
      num << LETTERS_TO_NUMBERS[char]
    end
    num
  end

  def rescan_for_numbers(string)
    numbered_string = ""
    segmented_words = string.split
    segmented_words.each do |word|
      if word[0] == "#"
        numbered_string << convert_to_numbers_from_trigger(word) + " "
      else
        numbered_string << word + " "
      end
    end
    numbered_string[0..-2]
  end
end






  if __FILE__ == $0
  night = NightWriter.new
  text = night.reader.read
  night.convert_to_braille(text)
  puts ARGV
  end