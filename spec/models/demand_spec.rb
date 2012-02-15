require 'spec_helper'

describe Demand do
  before(:each) do
    @attr = { :product_id => "1", :period_id => "1",
              :demand_quantity => "1", }
  end

  it "should create a new demand given valid attributes" do
    Demand.create!(@attr)
  end

  it "should require a product_id" do
    no_product_id_demand = Demand.new(@attr.merge(:product_id => ""))
    no_product_id_demand.should_not be_valid
  end

  it "should require a period_id" do
    no_period_id_demand = Demand.new(@attr.merge(:period_id => ""))
    no_period_id_demand.should_not be_valid
  end

  it "should require a demand quantity" do
    no_demand_quantity = Demand.new(@attr.merge(:demand_quantity => ""))
    no_demand_quantity.should_not be_valid
  end

   it "should reject product_id's that are too long" do
    long_product_id = "1" * 6
    long_product_id_demand = Demand.new(@attr.merge(:product_id => long_product_id))
    long_product_id_demand.should_not be_valid
   end

  it "should reject period_id's that are too long" do
    long_period_id = "1" * 6
    long_period_id_demand = Demand.new(@attr.merge(:period_id => long_period_id))
    long_period_id_demand.should_not be_valid
  end

  it "should reject demand_quantities that are too long" do
    long_quantity = "1" * 11
    long_quantity_demand = Demand.new(@attr.merge(:demand_quantity => long_quantity))
    long_quantity_demand.should_not be_valid
  end

  it "should reject demand_quantities that are no integer" do
    no_integer_quantity = "a"
    no_integer_quantity_demand = Demand.new(@attr.merge(:demand_quantity => no_integer_quantity))
    no_integer_quantity_demand.should_not be_valid
  end
end
