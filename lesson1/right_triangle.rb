puts "Введите стороны треугольника"
a = gets.to_i
b = gets.to_i
c = gets.to_i
rectangular = false

rectangular =
  if a > c && a > b
    (a**2 == b**2 + c**2)
  elsif b > c && b > a
    (b**2 == a**2 + c**2)
  elsif c > a && c > b
    (c**2 == a**2 + b**2)
  end

if rectangular && (a == b || b == c || c == a)
  puts "треугольник прямоугольный и равнобедренный"
elsif rectangular
  puts "треугольник прямоугольный"
elsif a == b && b == c
  puts "треугольник равностронний"
else
  puts "треугольник непрямоугольный"
end
