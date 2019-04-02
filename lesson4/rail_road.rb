class RailRoad
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def menu
    loop do
      puts "Введите 1, если хотите создать станцию, поезд или маршрут"
      puts "Введите 2, если вы хотите произвести операции с объектами"
      puts "Введите 3, если хотите вывести текущие данные о объектах"
      puts "Введите 0, если хотите закрыть программу"
      choise = gets.to_i
      case choise
      when 1
        create
      when 2
        do_action
      when 3
        display_info
      when 0
        break
      else
        puts "Вы ввели неправильное число"
      end
    end
  end

  private

  def create
    loop do
      puts "Введите 1, если хотите создать станцию"
      puts "Введите 2, если вы хотите создать поезд"
      puts "Введите 3, если хотите создать маршрут"
      puts "Введите 0, если вернуться в главное меню"
      choise = gets.to_i
      case choise
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 0
        break
      else
        puts "Вы ввели неправильное число"
      end
    end
  end

  def do_action
    loop do
      puts "Введите 1, если вы хотите произвести операции с поездом"
      puts "Введите 2, если вы хотите произвести операции с маршрутом"
      puts "Введите 0, если вернуться в главное меню"
      choise = gets.to_i
      case choise
      when 1
        actions_train
      when 2
        actions_route
      when 0
        break
      else
        puts "Вы ввели неправильное число"
      end
    end
  end

  def display_info
    loop do
      puts "Введите 1, если хотите посмотреть список станций"
      puts "Введите 2, если вы хотите список поездов на станции"
      puts "Введите 0, если вернуться в главное меню"
      choise = gets.to_i
      if choise == 1
        display_stations
      elsif choise == 2
        display_stations
        puts "Введите номер станции, список поездов на которой хотите посмотреть"
        station = @stations[gets.to_i]
        station.each_train do |train|
          puts "Номер: #{train.number}"
          puts "Тип поезда - #{train.type}"
          puts "Кол-во вагонов - #{train.wagons.size}"
          train.each_wagon do |wagon, index|
            puts "#{index} - тип вагона #{wagon.type}"
          end
        end
      elsif choise == 0
        break
      else
        puts "Вы ввели неправильное число"
      end
    end
  end

  def actions_train
    loop do
      display_trains
      puts "Введите порядковый номер поезда, c которым хотите совершить операцию"
      train = @trains[gets.to_i - 1]
      puts "Введите 1, если хотите добавить вагон к поезду"
      puts "Введите 2, если вы хотите удалить вагон"
      puts "Введите 3, если хотите переместить поезд на следующую станцию"
      puts "Введите 4, если хотите переместить поезд на предыдущую станцию"
      puts "Введите 5, если хотите назначить поезду маршрут"
      puts "Введите 0, если вернуться в главное меню"
      choise = gets.to_i
      case choise
      when 1
        wagon = get_wagon(train)
        train.attach_wagon(wagon)
      when 2
        @wagons.push(train.detach_wagon)
      when 3
        train.drive_forward
      when 4
        train.drive_back
      when 5
        display_routes
        puts "Введите порядковый номер маршрута, c которым хотите совершить операцию"
        route = @routes[gets.to_i]
        train.set_route(route)
      when 0
        break
      else
        puts "Вы ввели неправильное число"
      end
    end
  end

  def actions_route
    loop do
      display_routes
      puts "Введите порядковый номер маршрута, c которым хотите совершить операцию"
      route = @routes[gets.to_i]
      puts "Введите 1, если хотите добавить станцию к маршруту"
      puts "Введите 2, если вы хотите удалить станцию из маршрута"
      puts "Введите 3, если хотите назначить поезду маршрут"
      puts "Введите 0, если вернуться в главное меню"
      choise = gets.to_i
      case choise
      when 1
        display_stations
        puts "Введите номер станции, которую хотите добавить в маршрут"
        station = @stations[gets.to_i]
        route.add_station(station)
      when 2
        route.display_stations
        puts "Введите номер станции, которую хотите удалить из маршрута"
        station = @stations[gets.to_i]
        route.delete_station(station)
      when 3
        display_trains
        puts "Введите порядковый номер поезда, которуму хотите назначить маршрут"
        train = @trains[gets.to_i]
        train.set_route(route)
      when 0
        break
      else
        puts "Вы ввели неправильное число"
      end
    end
  end

  def create_station
    puts "Введите название станции"
    name = gets.chomp
    @stations.push(Station.new(name))
  end

  def create_train
    puts "Введите 1, если поезд грузовой \n Введите 2, если поезд пассажирский"
    type = gets.to_i
    puts "Введите номер поезда"
    number = gets.chomp.to_s
    train = if type == 1
              CargoTrain.new(number)
            elsif type == 2
              PassengerTrain.new(number)
            end
    puts "Поезд #{number} создан"
    @trains.push(train)
  end

  def get_wagon(train)
    if train.type == :passenger
        PassengerWagon.new()
    elsif train.type == :cargo
        CargoWagon.new()
    end
  end

  def create_route
    display_stations
    puts "Введите номер начальной станции"
    start_station = @stations[gets.to_i - 1]
    puts "Введите номер конечной станции"
    end_station = @stations[gets.to_i - 1]
    @routes.push(Route.new(start_station, end_station))
  end

  def display_stations
    @stations.each_with_index do |station, index|
      puts "#{index}-станция #{station.name}"
    end
  end

  def display_routes
    @routes.each_with_index do |route, index|
      puts "#{index}-маршрут"
      puts "#{route.display_stations}"
    end
  end

  def display_trains
    @trains.each_with_index do |train, index|
      puts "#{index}-поезд № #{train.number}"
    end
  end
end
