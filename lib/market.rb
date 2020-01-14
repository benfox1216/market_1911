class Market
  attr_reader :name, :vendors
  
  def initialize(name)
    @name = name
    @vendors = []
  end
  
  def add_vendor(vendor)
    @vendors << vendor
  end
  
  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end
  
  def vendors_that_sell(item)
    @vendors.map do |vendor|
      vendor if vendor.inventory.keys.include?(item)
    end.compact
  end
  
  def sorted_item_list
    @vendors.map do |vendor|
      vendor.inventory.keys.map do |item|
        item.name
      end
    end.flatten.uniq.sort
  end
  
  def total_inventory
    inventory = Hash.new(0)
    
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |item|
        inventory[item] += vendor.inventory[item]
      end
    end
    
    inventory
  end
  
  def sell(item, amt)
    if total_inventory[item] < amt
      return false
    else
      true
    end
  end
end