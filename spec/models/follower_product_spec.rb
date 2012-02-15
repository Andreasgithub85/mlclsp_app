require 'spec_helper'

describe FollowerProduct do
   before(:each) do
    @attr = { :coefficient => "1", :follower_id => "1",
              :product_id => "1", }
  end

  it "should create a new follower_product given valid attributes" do
    FollowerProduct.create!(@attr)
  end

   it "should require a coefficient" do
    no_coefficient = FollowerProduct.new(@attr.merge(:coefficient => ""))
    no_coefficient.should_not be_valid
  end

  it "should require a follower_id" do
    no_follower_id = FollowerProduct.new(@attr.merge(:follower_id => ""))
    no_follower_id.should_not be_valid
  end

  it "should require a product_id" do
    no_product_id = FollowerProduct.new(@attr.merge(:product_id => ""))
    no_product_id.should_not be_valid
  end

  it "should reject coefficients that are too long" do
    long_coefficient = "1" * 6
    long_coefficient_follower = FollowerProduct.new(@attr.merge(:coefficient => long_coefficient))
    long_coefficient_follower.should_not be_valid
   end

  it "should reject follower_id's that are too long" do
    long_follower_id = "1" * 6
    long_follower_id_product = FollowerProduct.new(@attr.merge(:follower_id => long_follower_id))
    long_follower_id_product.should_not be_valid
  end

  it "should reject product_id's that are too long" do
    long_product_id = "1" * 6
    long_product_id_follower = FollowerProduct.new(@attr.merge(:product_id => long_product_id))
    long_product_id_follower.should_not be_valid
  end

  it "should reject coefficients that are no integer" do
    no_integer_coefficient = "a"
    no_integer_coefficient_product = FollowerProduct.new(@attr.merge(:coefficient => no_integer_coefficient))
    no_integer_coefficient_product.should_not be_valid
  end
end
