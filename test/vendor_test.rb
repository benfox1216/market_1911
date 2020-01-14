require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class ItemTest < Minitest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end
  
  def test_it_exists
    assert_instance_of Vendor, @vendor
  end
  
  def test_it_has_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal ({}), @vendor.inventory
  end
  
  def test_it_can_check_stock_of_given_item
    assert_equal 0, @vendor.check_stock(@item1)
  end
end