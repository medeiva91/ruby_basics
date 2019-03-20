puts "Введите стороны треугольника"
a = gets.to_f
b = gets.to_f
c = gets.to_f
rectangular = false

x1 = [a,b,c].max
x2,x3 = [a,b,c].min(2)

rectangular = x1**2 == x2**2 + x3**2

if rectangular && (x2 == x3)
  puts "треугольник прямоугольный и равнобедренный"
elsif rectangular
  puts "треугольник прямоугольный"
elsif x1 == x2 && x2 == x3
  puts "треугольник равностронний"
else
  puts "треугольник непрямоугольный"
end
