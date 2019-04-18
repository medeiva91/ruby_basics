class Station
  include InstanceCounter
  include Validate

  attr_reader :trains, :name

  @@stations = []

  def initialize(name)
    @trains = []
    @name = name
    @@stations << self
    validate!
    register_instance
  end

  def self.all
    @@stations
  end

  def add_train(train)
    trains.push(train)
  end


  def train_with_type(type)
    trains.select { |train|  train.type == type  }
  end

  def send_train(train, next_station)
    trains.delete(train)
  end

  protected

  def validate!
    raise "Name can't be nil" if name.nil?
  end
end
