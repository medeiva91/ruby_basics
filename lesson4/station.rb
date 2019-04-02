class Station
  attr_reader :trains, :name

  def initialize(name)
    @trains = []
    @name = name
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
end
