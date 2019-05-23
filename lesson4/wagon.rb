# frozen_string_literal: true

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
    @taken_volume += value if has_free_volume?(value)
  end

  def free_volume
    total_volume - taken_volume
  end

  def has_free_volume?(value)
    free_volume >= value
  end
end
