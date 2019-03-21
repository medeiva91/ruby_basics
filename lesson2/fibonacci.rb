fibonacci = [0]
next_fibonacci = 1

while next_fibonacci < 100
  fibonacci << next_fibonacci
  next_fibonacci = fibonacci[-1] + fibonacci[-2]
end

puts fibonacci
