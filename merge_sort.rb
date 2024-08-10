def merge_sort(array, which_half_of_array = "left")
  puts "Split #{which_half_of_array}: #{array}"

  if array.size <= 1
    puts "Sorted: #{array}\n\n"
    return array
  else
    left_array = merge_sort(array.slice(0...array.size / 2), "left")
    right_array = merge_sort(array.slice(array.size / 2..-1), "right")

    array = merge_arrays(left_array, right_array)
  end

  puts "Merged array: #{array}\n\n"
  puts "----------------------------------------------------"
  array
end

def merge_arrays(left_array, right_array)
  sub_arrays = [left_array, right_array]
  puts "Merging(left: #{left_array}, right: #{right_array})"
  merged_arr = []

  until sub_arrays.any?(&:empty?)
    left_element = sub_arrays[0].first
    right_element = sub_arrays[1].first

    puts "Checking #{left_element} <=> #{right_element}"
    array_with_min_element = sub_arrays.min_by(&:first)
    puts "Add '#{array_with_min_element.first}' to merged array"
    merged_arr << array_with_min_element.shift
  end

  puts "Concat remainder '#{sub_arrays.flatten!}' to merged array"
  merged_arr.concat(sub_arrays)
end

merge_sort(Array.new(rand(10)) { rand(20) })
