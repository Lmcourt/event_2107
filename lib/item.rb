class Item

  attr_reader :name, :price
  def initialize(info)
    @name = info[:name]
    @price = info[:price].scan(/[.0-9]/).join().to_f
  end
end
