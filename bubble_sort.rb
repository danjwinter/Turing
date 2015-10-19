class BubbleSort
  def sort(elements)
     loop do
      times_swapped = 0
      elements.each_index do |index|
        if index != (elements.length - 1) && elements[index] > elements[index + 1]
          elements[index], elements[index + 1] = elements[index + 1], elements[index]
          times_swapped += 1
        end
      end
     break if times_swapped == 0
    end
    elements
  end
end
