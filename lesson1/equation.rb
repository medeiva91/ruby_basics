puts "Введите 3 коэффициента"
a = gets.to_f
b = gets.to_f
c = gets.to_f

d = b**2 - 4 * a * c

if d < 0
  puts "Корней нет"
elsif d == 0
  x = -b / (2.0 * a)
  puts "Дискриминант = #{d} \nКорень #{x}"
else
  half_d = Math.sqrt(d)
  x_1 = (-b + half_d) / (2.0 * a)
  x_2 = (-b - half_d) / (2.0 * a)
  puts "Дискриминант = #{d} \nКорни #{x_1} и #{x_2}"
end
