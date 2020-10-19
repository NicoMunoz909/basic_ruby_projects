def iterative_fibonacci(n)
  temp1 = 0
  temp2 = 1
  return temp1 if n == 0
  return temp2 if n == 1
  for i in 2..n
    temp3 = temp1 + temp2
    temp1 = temp2
    temp2 = temp3
  end
  return temp3
end

def recursive_fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1
  return recursive_fibonacci(n-1) + recursive_fibonacci(n-2)
end

puts iterative_fibonacci(12)
puts recursive_fibonacci(12)
