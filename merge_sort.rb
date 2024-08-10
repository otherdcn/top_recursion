def merge_sort(array, which_half_of_array = "left")
  puts "Split #{which_half_of_array}: #{array}"

  if array.size <= 1
    puts "Sorted: #{array}\n\n"
    return array
  else
    left_array = merge_sort(array.slice(0...array.size / 2))
    right_array = merge_sort(array.slice(array.size / 2..-1), "right")

    array = merge_arrays(left_array, right_array)
  end

  puts "Merge: #{array}\n\n"
  puts "----------------------------------------------------"
  array
end

def merge_arrays(left_array, right_array)
  puts "Merging(left: #{left_array}, right: #{right_array})"
  merged_arr = []
  left_array_remainders = left_array.size # use this to check if any elements left after comparing

  left_array.each_with_index do |left_element, left_idx|
    right_array_indices_to_nullify = [] # use this to nullify elements that have been merged so that they'r not checked again

    right_array.each_with_index do |right_element, right_idx|
      next if right_element.nil? # if a previous element in this position was checked, and then nullified, move to the next

      puts "Checking #{left_element} <=> #{right_element}"
      if (left_element <=> right_element) == 1
        merged_arr << right_element
        right_array_indices_to_nullify << right_idx # indicator that this element must be nullified (removed from another check)
      elsif (left_element <=> right_element) == -1
        merged_arr << left_element
        left_array_remainders -= 1 # this will indicate to only append unchecked elements
        break
      else
        merged_arr << left_element
        left_array_remainders -= 1 # this will indicate to only append unchecked elements
        break
      end
    end
    right_array_indices_to_nullify.each { |element| right_array[element] = nil } unless right_array_indices_to_nullify.empty?
  end
  right_array.delete(nil) # remove nil elements

  # If there are any elements left in either left/right array, then append to final merged array
  merged_arr << left_array.last(left_array_remainders) if left_array_remainders > 0
  merged_arr << right_array

  merged_arr.flatten # remove any multi-dimensional array elements
end

#merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
merge_sort(Array.new(rand(16)) { rand(20) })
