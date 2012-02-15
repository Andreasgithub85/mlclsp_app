require 'spec_helper'

describe Product do
  before(:each) do
         @attr = { :product_name => "1", :leadtime_shift => "1", :resource => "1", :setup_time => "1", :setup_cost => "1",
                   :storage_cost => "1", :working_time => "1", :start_inventory => "1"}
  end

  it "should create a new product given valid attributes" do
    Product.create!(@attr)
  end

  it "should require a product name" do
    no_product_name = Product.new(@attr.merge(:product_name => ""))
    no_product_name.should_not be_valid
  end

  it "should require a leadtime shift" do
    no_leadtime_shift = Product.new(@attr.merge(:leadtime_shift => ""))
    no_leadtime_shift.should_not be_valid
  end

  it "should require a resource" do
    no_resource = Product.new(@attr.merge(:resource => ""))
    no_resource.should_not be_valid
  end

  it "should require a setup time" do
    no_setup_time = Product.new(@attr.merge(:setup_time => ""))
    no_setup_time.should_not be_valid
  end

  it "should require a setup cost" do
    no_setup_cost = Product.new(@attr.merge(:setup_cost => ""))
    no_setup_cost.should_not be_valid
  end

  it "should require a storage cost" do
    no_storage_cost = Product.new(@attr.merge(:storage_cost => ""))
    no_storage_cost.should_not be_valid
  end

  it "should require a working time" do
    no_working_time = Product.new(@attr.merge(:working_time => ""))
    no_working_time.should_not be_valid
  end

  it "should require a start inventory" do
    no_start_inventory = Product.new(@attr.merge(:start_inventory => ""))
    no_start_inventory.should_not be_valid
  end

  it "should reject product names that are too long" do
    long_product_name = "1" * 16
    long_product_name_product = Product.new(@attr.merge(:product_name => long_product_name))
    long_product_name_product.should_not be_valid
  end

  it "should reject leadtime shifts that are too long" do
    long_leadtime_shift = "1" * 6
    long_leadtime_shift_product = Product.new(@attr.merge(:leadtime_shift => long_leadtime_shift))
    long_leadtime_shift_product.should_not be_valid
  end

  it "should reject resources that are too long" do
    long_resource = "1" * 16
    long_resource_product = Product.new(@attr.merge(:resource => long_resource))
    long_resource_product.should_not be_valid
  end

  it "should reject setup times that are too long" do
    long_setup_time = "1" * 6
    long_setup_time_product = Product.new(@attr.merge(:setup_time => long_setup_time))
    long_setup_time_product.should_not be_valid
  end

  it "should reject setup costs that are too long" do
    long_setup_cost = "1" * 6
    long_setup_cost_product = Product.new(@attr.merge(:setup_cost => long_setup_cost))
    long_setup_cost_product.should_not be_valid
  end

  it "should reject storage costs that are too long" do
    long_storage_cost = "1" * 11
    long_storage_cost_product = Product.new(@attr.merge(:storage_cost => long_storage_cost))
    long_storage_cost_product.should_not be_valid
  end

  it "should reject working times that are too long" do
    long_working_time = "1" * 6
    long_working_time_product = Product.new(@attr.merge(:working_time => long_working_time))
    long_working_time_product.should_not be_valid
  end

  it "should reject start inventories that are too long" do
    long_start_inventory = "1" * 6
    long_start_inventory_product = Product.new(@attr.merge(:start_inventory => long_start_inventory))
    long_start_inventory_product.should_not be_valid
  end


  it "should reject duplicate product names" do
    Product.create!(@attr)
    product_with_duplicate_name = Product.new(@attr)
    product_with_duplicate_name.should_not be_valid
  end

  it "should reject leadtime shifts that are no integer" do
    no_integer = "a"
    no_integer_leadtime_shift = Product.new(@attr.merge(:leadtime_shift => no_integer))
    no_integer_leadtime_shift.should_not be_valid
  end

  it "should reject setup times that are no integer" do
    no_integer = "a"
    no_integer_setup_time = Product.new(@attr.merge(:setup_time => no_integer))
    no_integer_setup_time.should_not be_valid
  end

  it "should reject setup costs that are no integer" do
    no_integer = "a"
    no_integer_setup_cost = Product.new(@attr.merge(:setup_cost => no_integer))
    no_integer_setup_cost.should_not be_valid
  end

  it "should reject storage costs that are no integer" do
    no_integer = "a"
    no_integer_storage_cost = Product.new(@attr.merge(:storage_cost => no_integer))
    no_integer_storage_cost.should_not be_valid
  end

  it "should reject working times that are no integer" do
    no_integer = "a"
    no_integer_working_time = Product.new(@attr.merge(:working_time => no_integer))
    no_integer_working_time.should_not be_valid
  end

  it "should reject start inventories that are no integer" do
    no_integer = "a"
    no_integer_start_inventories = Product.new(@attr.merge(:start_inventory => no_integer))
    no_integer_start_inventories.should_not be_valid
   end
end
