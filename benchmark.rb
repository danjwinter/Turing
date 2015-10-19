require_relative 'insert_sort'
require_relative "bubble_sort"
require_relative "merge_sort"
require "benchmark"

require 'pry'

#module SortingSuite

  class Benchmark
    def time(sorting_method, arr=Array(1..1000).shuffle)
      time = Benchmark.realtime {sorting_method.new.sort(arr)}
      puts "Time elapsed #{time * 1000} milliseconds"
    end
  end
#end


benchmark = SortingSuite::Benchmark.new
benchmark.time(MergeSort)
