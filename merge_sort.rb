# Some neat auxilliary data on this: https://www.toptal.com/developers/sorting-algorithms/merge-sort

def merge_arrays array1, array2
  result_array = []
  until array1.empty? || array2.empty?
    array1[0] >= array2[0] ? result_array << array2.shift : result_array << array1.shift
  end
  return (result_array << array2).flatten if array1.empty?
  return (result_array << array1).flatten
end

# Take in a pre-split array
def merge_sort array
  return array if array.length <= 1
  # arr1, arr2 = array.each_slice((array.size/2.0).round).to_a # Seems to be a bit slower than the method below
  arr1 = array[0..((array.length/2 - 1))]
  arr2 = array[(array.length/2)..(array.length-1)]
  return merge_arrays(merge_sort(arr1), merge_sort(arr2)) # Divide and conquer!
end

test_array = []

1000.times do
  test_array << rand(100)
end

# puts "Array: #{test_array}"

require 'benchmark'

Benchmark.bm do |bm|
  bm.report("merge sort: ") do
    arr = merge_sort(test_array)
    puts arr.length # Works out fine
  end
  bm.report("ruby sort: ") do
    test_array.sort
  end
end