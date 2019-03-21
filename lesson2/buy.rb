hash_goods = {}
all_amount = 0

loop do
  puts "Введите название товара. Если хотите закончить, введите стоп"
  good = gets.chomp
  break if good == 'стоп'

  puts "Введите цену."
  price = gets.to_f
  while price <= 0
    puts "Цена должна быть больше 0. Введите цену."
    price = gets.to_f
  end

  puts "Введите кол-во товара."
  quantity = gets.to_f
  while quantity <= 0
    puts "Кол-ва товара должно быть больше 0. Введите кол-во товара."
    quantity = gets.to_f
  end

  hash_goods[good] = { price: price, quantity: quantity }
end

hash_goods.each do |good, value|
  amount = value[:price] * value[:quantity]
  all_amount += amount
  puts "#{good} - цена: #{value[:price]}, количество: #{value[:quantity]}. Всего за товар - #{amount}"
end

puts "Общая цена за товары: #{all_amount}"
