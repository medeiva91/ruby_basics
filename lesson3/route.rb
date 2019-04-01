class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station) unless [stations.first, stations.last].include?(station)
  end

  def display_stations
    stations.each { |station| puts station.name }
  end

end
