class Wagon
  include Info
  attr_reader :type, :total_volume, :taken_volume

  def initialize(total_volume)
    @total_volume = total_volume
    @taken_volume = 0
  end

  def set_to_zero
    @taken_volume = 0
  end

  def add_taken_place(value)
    if has_free_volume?
      @taken_volume += value
    end
  end

  def free_volume
    total_volume - taken_volume
  end

  def has_free_volume?(value)
    if free_volume >= value
      true
    else
      false
    end
  end
end
