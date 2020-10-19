def merge_sort(array)
  return array if array.length < 2

  l_half = merge_sort(array[0...array.length/2])
  r_half = merge_sort(array[array.length/2...array.length])

  sorted_array = []

  for i in 0...array.length
    unless (l_half.empty? || r_half.empty?)
      if l_half[0] <= r_half[0]
        sorted_array.push(l_half.shift)
      else
        sorted_array.push(r_half.shift)
      end
    end
  end
  
  sorted_array = sorted_array + l_half + r_half
  return sorted_array
end

p merge_sort([5,1,5,1,50,2,62,4])