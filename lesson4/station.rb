# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validate

  attr_reader :trains, :name

  @@stations = []

  def initialize(name)
    @trains = []
    @name = name
    validate!
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def add_train(train)
    trains.push(train)
  end

  def train_with_type(type)
    trains.select { |train| train.type == type }
  end

  def send_train(train, _next_station)
    trains.delete(train)
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  protected

  def validate!
    raise "Name can't be nil" if name.nil?
  end
end
