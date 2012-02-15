require 'spec_helper'

describe Period do
   before(:each) do
    @attr = { :period_name => "1" }
  end

  it "should create a new period given valid attributes" do
    Period.create!(@attr)
  end

  it "should require a period name" do
    no_period_name = Period.new(@attr.merge(:period_name => ""))
    no_period_name.should_not be_valid
  end

   it "should reject period names that are too long" do
    long_period_name = "1" * 16
    long_period_name_product = Period.new(@attr.merge(:period_name => long_period_name))
    long_period_name_product.should_not be_valid
   end

   it "should reject period names that are no integer" do
    no_integer_period = "a"
    no_integer_period_name = Period.new(@attr.merge(:period_name => no_integer_period))
    no_integer_period_name.should_not be_valid
   end

  it "should reject duplicate period names" do
    Period.create!(@attr)
    period_with_duplicate_name = Period.new(@attr)
    period_with_duplicate_name.should_not be_valid
  end
end
