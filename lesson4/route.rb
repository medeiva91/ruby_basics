class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
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

end
