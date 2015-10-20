require 'pry'
class FileReader
  def read
    filename = ARGV[0]
    NightWriter.new(File.read(filename))
  end
end

class NightWriter
  attr_reader :reader, :string

  def initialize(reader)
    @reader = FileReader.new
    @string = reader
  #   binding.pry
  end

  ALPHABET_TO_BRAILLE = {
    "a" => ["0.", "..", ".."],
    "b" => ["0.", "0.", ".."],
    "c" => ["00", "..", ".."],
    "d" => ["00", ".0", ".."],
    "e" => ["0.", ".0", ".."],
    "f" => ["00", "0.", ".."],
    "g" => ["00", "00", ".."],
    "h" => ["0.", "00", ".."],
    "i" => [".0", "0.", ".."],
    "j" => [".0", "00", ".."],
    "k" => ["0.", "..", "0."],
    "l" => ["0.", "0.", "0."],
    "m" => ["00", "..", "0."],
    "n" => ["00", ".0", "0."],
    "o" => ["0.", ".0", "0."],
    "p" => ["00", "0.", "0."],
    "q" => ["00", "00", "0."],
    "r" => ["0.", "00", "0."],
    "s" => [".0", "0.", "0."],
    "t" => [".0", "00", "0."],
    "u" => ["0.", "..", "00"],
    "v" => ["0.", "0.", "00"],
    "w" => [".0", "00", ".0"],
    "x" => ["00", "..", "00"],
    "y" => ["00", ".0", "00"],
    "z" => ["0.", ".0", "00"],
    " " => ["..", "..", ".."]
  }

  BRAILLE_TO_ALPHABET = ALPHABET_TO_BRAILLE.invert



  # def grab_last_chars
  #   if @string.length < 40
  #     return @string
  #   else
  #     number_of_chunks = (@string.length / 40).floor
  #   #  leftover_chars = string.char % 40
  #     chop_point = number_of_chunks * 40 + 1
  #     chopped_chars = @string[chop_point..-1]
  #     @string = @string - @string[chop_point..-1]
  #     chopped_chars
  #   end
  # end
  #
  def chunk_from_alphabet
    @string.delete "\n" "." "," "-" "\'"
    @string.chars.each_slice(40).map(&:join)
  end
  #
  # def chunk_from_braille
  #   tr.chars.each_slice(160).map(&:join)
  # end
  #
  # def convert_to_braille
  #   chopped_chars = grab_last_chars
  #   chunked_string = chunk_from_alphabet + chopped_chars
  #   chunked_string.each do |line_of_output|  #this should give you each line_of_output that equates to a line of 80 characters
  #     top = ""
  #     middle = ""
  #     bottom = ""
  #     line_of_output.each_char do |char| #this should give you each character from each line
  #       top << "#{ALPHABET_TO_BRAILLE[char][0]}"
  #       middle << "#{ALPHABET_TO_BRAILLE[char][1]}"
  #       bottom << "#{ALPHABET_TO_BRAILLE[char][2]}"
  #     end
  #     puts top
  #     puts middle
  #     puts bottom
  #   end
  # end
end
FileReader.new.read
puts ARGV
