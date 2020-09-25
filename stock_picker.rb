def stock_picker(array)
  highest = 0;
  for i in 0...array.length do
    for j in (i == (array.length - 1)? (array.length-1):(i+1))...array.length do
      if ((array[j] - array[i]) > highest)
        highest = array[j] - array[i]
        buy = i;
        sell = j;
      end
    end
  end
  return [buy,sell]
end

p stock_picker([17,3,6,9,15,8,6,1,10])