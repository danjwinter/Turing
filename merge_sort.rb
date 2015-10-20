class MergeSort
  def initialize
  end

  def sort(arr)
    new_arr = []
    if arr.length >= 3
      mid_point_left = (arr.length / 2).floor - 1
      left = sort(arr[0..mid_point_left])

      mid_point_right = (arr.length / 2)
      right = sort(arr[mid_point_right..-1])
    elsif arr.length == 2
      left = [arr[0]]
      right = [arr[1]]
    else
      return arr
    end
    i = 0
    j = 0
    while i < left.length || j < right.length do
      if i < left.length && j < right.length   # case of one element in each array
        if left[i] < right[j]
          new_arr << left[i]
          i += 1
        else
          new_arr << right[j]
          j += 1
        end
      else
        if i < left.length
          new_arr << left[i]
          i += 1
        else
          new_arr << right[j]
          j += 1
        end
      end
    end
    new_arr
  end
end
