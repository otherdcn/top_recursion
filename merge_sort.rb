def merge_sort(array)
  puts "Split: #{array}"

  if array.size <= 1
    puts "Sorted: #{array}\n\n"
    return array
  else
    left_array = merge_sort(array.slice(0...array.size / 2))
    right_array = merge_sort(array.slice(array.size / 2..-1))

    array = merge_arrays(left_array, right_array)
  end

  puts "Merge: #{array}\n\n"
  array
end

def merge_arrays(left_array, right_array)
  puts "Merging(left: #{left_array}, right: #{right_array})"
  merged_arr = []
  left_remainders = left_array.size

  left_array.each_with_index do |left_element, left_idx|
    remove_element_b = []

    right_array.each_with_index do |right_element, right_idx|
      next if right_element.nil?
      puts "Checking #{left_element} <=> #{right_element}"
      if (left_element <=> right_element) == 1
        merged_arr << right_element
        remove_element_b << right_idx
      elsif (left_element <=> right_element) == -1
        merged_arr << left_element
        left_remainders -= 1
        break
      else
        merged_arr << left_element
        left_remainders -= 1
        break
      end
    end
    remove_element_b.each { |element| right_array[element] = nil } unless remove_element_b.empty?
  end
  right_array.delete(nil)
  merged_arr << left_array.last(left_remainders) if left_remainders > 0
  merged_arr << right_array

  merged_arr.flatten
end

#merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
merge_sort(Array.new(rand(16)) { rand(20) })
