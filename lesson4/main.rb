require_relative 'modules/info'
require_relative 'modules/instance_counter'
require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'rail_road'

puts "Привет, это программа - абстракция железной дороги"

road = RailRoad.new
road.menu
