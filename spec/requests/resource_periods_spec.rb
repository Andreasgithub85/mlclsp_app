require 'spec_helper'

describe "ResourcePeriods" do
  describe "GET /resource_periods" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get resource_periods_path
      response.status.should be(200)
    end
  end
end
