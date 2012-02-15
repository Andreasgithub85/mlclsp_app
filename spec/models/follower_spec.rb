require 'spec_helper'

describe Follower do
   before(:each) do
    @attr = { :follower_name => "1" }
  end

  it "should create a new follower given valid attributes" do
    Follower.create!(@attr)
  end

  it "should require a follower name" do
    no_follower_name = Follower.new(@attr.merge(:follower_name => ""))
    no_follower_name.should_not be_valid
  end

   it "should reject follower names that are too long" do
    long_follower_name = "1" * 16
    long_follower_name_product = Follower.new(@attr.merge(:follower_name => long_follower_name))
    long_follower_name_product.should_not be_valid
   end

  it "should reject duplicate follower names" do
    Follower.create!(@attr)
    follower_with_duplicate_name = Follower.new(@attr)
    follower_with_duplicate_name.should_not be_valid
  end
end
