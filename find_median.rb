require 'benchmark'

# Using randomization to quickly find the median of a group of numbers

numbers = []
iterator = 5000000

iterator.times do 
  numbers << rand(1000)
end

# Just rounds halves down
def round_down n 
  n % 1 == 0 ? n : n - 0.5
end

def non_random_median numbers
  numbers_sorted = numbers.sort
  numbers_sorted[round_down((numbers.length / 2))]
end

# Speed differences start to show up around a million numbers
def random_median numbers, i = nil, n = nil
  n ||= numbers.length
  # Below: Our dataset is probably quite small if we randomly select the biggest number 
  # -- at that point, just sort and get the median that way (avoids some infinite-loop issues I was having before)
  return non_random_median(numbers) if past_n = n
  i ||= round_down(n / 2)
  past_n = n
  # puts "Index: #{i}"
  random_number = numbers.sample
  smaller_numbers = numbers.select { |i| i <= random_number }
  larger_numbers = numbers.select { |i| i > random_number}
  s_n_length = smaller_numbers.length
  l_n_length = larger_numbers.length
  # puts "Random number: #{random_number}"
  # puts "Smaller numbers: #{smaller_numbers}"
  # puts "Larger numbers: #{larger_numbers}"
  if s_n_length <= i
    # puts "Recurring with larger numbers"
    random_median(larger_numbers, round_down(i - s_n_length), l_n_length)
  else
    # puts "Recurring with smaller numbers"
    # You were doing some really convoluted math until you realized the index shouldn't change when we recur with the smaller numbers
    random_median(smaller_numbers, i, s_n_length)
  end
end

Benchmark.bm do |bm|
  bm.report("non-random: ") do
    puts non_random_median(numbers)
  end
  bm.report("random: ") do
    puts random_median(numbers)
  end
  bm.report("median of medians: ") do
    puts "Not finished yet"
  end
end