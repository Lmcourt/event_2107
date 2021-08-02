class Event

  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.check_stock(item) > 0
    end
  end

  def total_inventory
    total = Hash.new(0)
    item = @food_trucks.flat_map do |truck|
      truck.inventory.find_all do |item, num|
        total[item] = {}
      end
    end

    #This should probably be a seperate method but I wanted to get the quantity first.
      @food_trucks.flat_map do |truck|
        truck.inventory.each do |item, num|
          # require "pry"; binding.pry
          total[item] = {
            quantity: truck.stock(item, num),
            food_trucks: food_trucks_that_sell(item)
          }
        end
      end
      # require "pry"; binding.pry
    total
  end
end
