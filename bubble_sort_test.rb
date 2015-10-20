require_relative './bubble_sort'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'


class BubbleTest < Minitest::Test
  def test_sorts_an_empty_array
    sorter = BubbleSort.new
    assert_equal [], sorter.sort([])
  end

  def test_it_sorts_one_element
    sorter = BubbleSort.new
    assert_equal [1], sorter.sort([1])
  end

  def test_it_sorts_two_elements
    sorter = BubbleSort.new
    assert_equal [1, 2], sorter.sort([2, 1])
  end

  def test_it_sorts_three_elements
    sorter = BubbleSort.new
    assert_equal [1, 2, 3], sorter.sort([3, 2, 1])
  end

  def test_it_sorts_reverse_arrays
    sorter = BubbleSort.new
    assert_equal [1, 2, 3, 4], sorter.sort([4, 3, 2, 1])
  end

  def test_it_sorts_presorted_arrays
    sorter = BubbleSort.new
    assert_equal [1, 2, 3, 4, 5], sorter.sort([1, 2, 3, 4, 5])
  end

  def test_it_sorts_strings
    sorter = BubbleSort.new
    assert_equal ['a', 'b', 'c', 'd', 'e', 'f'], sorter.sort(['a', 'b', 'd', 'f', 'e', 'c'])
  end

  def test_it_sorts_one_thousand_elements
    sorter = BubbleSort.new
    array_of_one_thousand = Array(0..10000).shuffle
    assert_equal array_of_one_thousand.sort, sorter.sort(array_of_one_thousand)
  end
end
