class InsertionSort
	def sort(list)
		list.each_with_index do |num, index|
      counter = 1
      if num < list[index - counter] && index == 1
        list.insert(index - counter, num)
        list.delete_at(index + 1)
      elsif num < list[index - counter] && index != 0
        loop do
          counter +=1
          if index - counter < 0
            list.insert(0, num)
            list.delete_at(index + 1)
            break
          elsif list[index - counter] < num
            list.insert(index - counter + 1, num)
            list.delete_at(index + 1)
            break
          end
        end
      end
    end
  end
end
