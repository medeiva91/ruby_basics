class Train
  attr_reader :type, :speed, :route, :number, :wagons

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def attach_wagon(wagon)
    @wagons.push(wagon) if speed.zero?
  end

  def detach_wagon
    @wagons.pop if speed.zero? && !@wagons.empty?
  end

  def set_route(route)
    route.stations[0].add_train(self)
    @index_station = 0
    @route = route
  end

  def current_station
    route.stations[@index_station]
  end

  def speed_up(count)
    @speed += count
  end

  def deceleration(value)
    @speed = value < @speed ? @speed - value : 0
  end

  def drive_forward
    if next_station
      current_station.send_train(self)
      next_station.add_train(self)
      @index_station += 1
    end
  end

  def drive_back
    if prev_station
      current_station.send_train(self)
      prev_station.add_train(self)
      @index_station -= 1
    end
  end

  def prev_station
    route.stations[@index_station - 1] if @index_station > 0
  end

  def next_station
    route.stations[@index_station + 1] if route.stations[@index_station + 1]
  end



end
