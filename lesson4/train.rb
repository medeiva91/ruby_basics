# frozen_string_literal: true

class Train
  include InstanceCounter
  include Validate
  attr_reader :type, :speed, :route, :number, :wagons

  @@trains = {}
  NUMBER_FORMAT = /^[а-яa-z0-9]{3}-*[а-яa-z0-9]{2}$/i.freeze

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    validate!
    @@trains[number.to_s.to_sym] = self
    register_instance
  end

  def stop
    self.speed = 0
  end

  def self.find(number)
    @@trains[number.to_s.to_sym]
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
    route.stations[@index_station - 1] if @index_station.positive?
  end

  def next_station
    route.stations[@index_station + 1]
  end

  def each_wagon
    @wagons.each_with_index { |wagon, index| yield(wagon, index) }
  end

  protected

  def validate!
    raise "Number can't be nil" if number.nil?
    raise 'Number has invalid format' if number !~ NUMBER_FORMAT
  end
end
