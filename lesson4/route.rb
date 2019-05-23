# frozen_string_literal: true

class Route
  include InstanceCounter
  include Validate
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
    register_instance
  end

  def start_station
    stations.first
  end

  def end_station
    stations.last
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station) unless [start_station, end_station].include?(station)
  end

  def display_stations
    @stations.each_with_index do |station, index|
      puts "#{index}-станция #{station.name}"
    end
  end

  protected

  def validate!
    raise 'Start_station is not Station' unless start_station.class == Station
    raise 'End_station is not Station' unless end_station.class == Station
    raise 'End_station can not = start_station' if start_station == end_station
  end
end
