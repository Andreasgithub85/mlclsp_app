require 'spec_helper'

describe ResourcePeriod do
  before(:each) do
    @attr = { :capacity => "1", :resource_id => "1",
              :period_id => "1", }
  end


  it "should create a new resource period valid attributes" do
    ResourcePeriod.create!(@attr)
  end

  it "should require a capacity" do
    no_capacity = ResourcePeriod.new(@attr.merge(:capacity => ""))
    no_capacity.should_not be_valid
  end

  it "should require a period_id" do
    no_period_id = ResourcePeriod.new(@attr.merge(:period_id => ""))
    no_period_id.should_not be_valid
  end

  it "should require a resource_id" do
    no_resource_id = ResourcePeriod.new(@attr.merge(:resource_id => ""))
    no_resource_id.should_not be_valid
  end

  it "should reject capacities that are too long" do
    long_capacity = "1" * 16
    long_capacity_resource = ResourcePeriod.new(@attr.merge(:capacity => long_capacity))
    long_capacity_resource.should_not be_valid
  end

  it "should reject resource_id's that are too long" do
    long_resource_id = "1" * 16
    long_resource_id_resource = ResourcePeriod.new(@attr.merge(:resource_id => long_resource_id))
    long_resource_id_resource.should_not be_valid
  end

  it "should reject period_id's that are too long" do
    long_period_id = "1" * 16
    long_period_id_resource = ResourcePeriod.new(@attr.merge(:period_id => long_period_id))
    long_period_id_resource.should_not be_valid
  end

  it "should reject capacities that are no integer" do
    no_integer = "a"
    no_integer_capacity = ResourcePeriod.new(@attr.merge(:capacity => no_integer))
    no_integer_capacity.should_not be_valid
  end

  it "should reject resource_id's that are no integer" do
    no_integer = "a"
    no_integer_resource_id = ResourcePeriod.new(@attr.merge(:resource_id => no_integer))
    no_integer_resource_id.should_not be_valid
  end

  it "should reject period_id's that are no integer" do
    no_integer = "a"
    no_integer_period_id = ResourcePeriod.new(@attr.merge(:period_id => no_integer))
    no_integer_period_id.should_not be_valid
   end
end
