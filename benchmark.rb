require_relative 'insertion_sort'
require_relative 'bubble_sort'
require_relative 'merge_sort'

module SortingSuite
   class Benchmark
     def initialize
     end

     def time(sorting_method, arr=Array(1..1000).shuffle)
       sorting_object = sorting_method.new
       time_1 = Time.now
       sorting_object.sort(arr)
       time_2 = Time.now
       time_elapsed = time_2 - time_1
       "#{sorting_method} took #{time_elapsed} seconds."
     end

     def fastest(arr)
       bubble = BubbleSort.new
       time_1 = Time.now
       bubble.sort(arr)
       time_2 = Time.now
       bubble_time_elapsed = time_2 - time_1


       insertion = InsertionSort.new
       time_1 = Time.now
       insertion.sort(arr)
       time_2 = Time.now
       insertion_time_elapsed = time_2 - time_1


       merge = MergeSort.new
       time_1 = Time.now
       merge.sort(arr)
       time_2 = Time.now
       merge_time_elapsed = time_2 - time_1

       if bubble_time_elapsed < insertion_time_elapsed && bubble_time_elapsed < merge_time_elapsed
         "BubbleSort is the fastest"
       elsif insertion_time_elapsed < bubble_time_elapsed && insertion_time_elapsed < merge_time_elapsed
         "InsertionSort is the fastest"
       elsif merge_time_elapsed < bubble_time_elapsed && merge_time_elapsed < insertion_time_elapsed
         "MergeSort is the fastest"
       end
     end

     def slowest(arr)
       bubble = BubbleSort.new
       time_1 = Time.now
       bubble.sort(arr)
       time_2 = Time.now
       bubble_time_elapsed = time_2 - time_1


       insertion = InsertionSort.new
       time_1 = Time.now
       insertion.sort(arr)
       time_2 = Time.now
       insertion_time_elapsed = time_2 - time_1


       merge = MergeSort.new
       time_1 = Time.now
       merge.sort(arr)
       time_2 = Time.now
       merge_time_elapsed = time_2 - time_1

       if bubble_time_elapsed > insertion_time_elapsed && bubble_time_elapsed > merge_time_elapsed
         "BubbleSort is the slowest"
       elsif insertion_time_elapsed > bubble_time_elapsed && insertion_time_elapsed > merge_time_elapsed
         "InsertionSort is the slowest"
       elsif merge_time_elapsed > bubble_time_elapsed && merge_time_elapsed > insertion_time_elapsed
         "MergeSort is the slowest"
       end
     end

     binding.pry
   end
 end



benchmark = SortingSuite::Benchmark.new
puts benchmark.time(MergeSort)
puts benchmark.fastest([2, 8, 1, 0, 5])
puts benchmark.slowest([1, 2, 3, 4, 5])
