require 'spec_helper'

describe Resource do
  before(:each) do
    @attr  = { :resource_name => "1" }
  end

  it "should create a new resource given valid attributes" do
    Resource.create!(@attr)
  end

  it "should require a resource name" do
    no_resource_name = Resource.new(@attr.merge(:resource_name => ""))
    no_resource_name.should_not be_valid
  end

   it "should reject resource names that are too long" do
    long_resource_name = "1" * 16
    long_resource_name_resource = Resource.new(@attr.merge(:resource_name => long_resource_name))
    long_resource_name_resource.should_not be_valid
   end

  it "should reject duplicate resource names" do
    Resource.create!(@attr)
    resource_with_duplicate_name = Resource.new(@attr)
    resource_with_duplicate_name.should_not be_valid
  end
end
