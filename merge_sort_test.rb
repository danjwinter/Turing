require 'minitest'
require './merge_sort'

class MergeTest < Minitest::Test
  def test_sorts_an_array
    sorter = MergeSort.new
    assert_equal [], sorter.sort([])
  end

  def test_it_sorts_one_element
    sorter = MergeSort.new
    assert_equal [1], sorter.sort([1])
  end

  def test_it_sorts_two_elements
    sorter = MergeSort.new
    assert_equal [1, 2], sorter.sort([2, 1])
  end

  def test_it_sorts_three_elements
    sorter = MergeSort.new
    assert_equal [1, 2, 3], sorter.sort([3, 2, 1])
  end

  def test_it_sorts_reverse_arrays
    sorter = MergeSort.new
    assert_equal [1, 2, 3, 4], sorter.sort([4, 3, 2, 1])
  end

  def test_it_sorts_presorted_arrays
    sorter = MergeSort.new
    assert_equal [1, 2, 3, 4, 5], sorter.sort([1, 2, 3, 4, 5])
  end

  def test_it_sorts_strings
    sorter = MergeSort.new
    assert_equal ['a', 'b', 'd', 'f', 'e', 'c'], sorter.sort(['a', 'b', 'c', 'd', 'e', 'f'])
  end

  def test_it_sorts_one_thousand_elements
    sorter = MergeSort.new
    array_of_one_thousand = Array(0..10000).shuffle
    assert_equal array_of_one_thousand.sort, sorter.sort(array_of_one_thousand)
  end
end
