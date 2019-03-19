puts 'Введите свое имя и рост'

name = gets.chomp.capitalize
weight = gets.chomp.to_i
ideal_weight = weight - 110

if ideal_weight < 0
  puts "Ваш вес уже оптимальный"
else
  puts "#{name}, ваш идеальный вес - #{ideal_weight}"
end
