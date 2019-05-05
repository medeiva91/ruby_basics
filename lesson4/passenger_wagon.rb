class PassengerWagon < Wagon
  def type
    :passenger
  end

  def add_taken_place
    super(1)
  end
end
