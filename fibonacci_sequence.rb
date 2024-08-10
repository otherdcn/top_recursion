# Return the 'nth' Fibonacci sequence
def nth_fibonacci(n)
  return n if n <= 1

  nth_fibonacci(n-1) + nth_fibonacci(n-2)
end

# --- Return array containing that many numbers from the Fibonacci sequence

# Iterative version
def fibs(n)
  sequence = [0,1]

  (n - sequence.size).times { sequence << sequence[-2] + sequence[-1] }
  sequence[0...n]
end

# Recursive version
def fibs_rec(n, sequence = [0,1])
  sequence << sequence[-2] + sequence[-1]

  if n <= sequence.size
    return sequence[0...n]
  else
    fibs_rec(n, sequence)
  end

  sequence
end

p nth_fibonacci(6)
p fibs(8)
p fibs_rec(8)

