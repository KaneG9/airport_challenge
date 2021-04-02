require_relative "plane"

class Airport
  attr_reader :hanger
  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    raise "The airport is full." if full?
    raise "The weather is stormy, no planes can land." if weather == "stormy"
    raise "The plane is already in the hanger. It cannot land again." if hanger.include? plane

    @hanger << plane
  end

  def takeoff(plane)
    raise "The weather is stormy, no planes can takeoff." if weather == "stormy"
    raise "The plane is not in the hanger. It cannot takeoff." unless hanger.include? plane

    @hanger.delete(plane)
  end

  private
  def full?
    @hanger.size >= @capacity
  end

  def weather
    rand(10) <= 8 ? "sunny" : "stormy" # weather is stormy 10% of the time
  end
end
