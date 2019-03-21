months = [31, 28 , 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
serial_number = 0

puts "Введите число"
day = gets.to_i

puts "Введите месяц"
month_get = gets.to_i

puts "Введите год"
year = gets.to_i

months[1] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
months.first(month_get - 1).each { |count| serial_number += count }
serial_number += day

puts serial_number
