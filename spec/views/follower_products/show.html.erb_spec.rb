require 'spec_helper'

describe "follower_products/show.html.erb" do
  before(:each) do
    @follower_product = assign(:follower_product, stub_model(FollowerProduct,
      :coefficient => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
