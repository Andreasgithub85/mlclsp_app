require 'spec_helper'

describe ResourcePeriodsController do
  render_views


 describe "GET 'index'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
    response.should have_selector("title",
                    :content =>  "Listing Resources Periods")
  end

 end

  describe "GET 'new'" do

    it "should be successful" do
      get :new
      response.should be_success
    end


    it "should have the right title" do
      get :new
      response.should have_selector("title",
                                  :content => "New Resources Periods")
    end

  end


 describe "GET 'show'" do

   before(:each) do
      @resource_period = Factory(:resource_period)
    end

   it "should be successful" do
     get :show, :id => @resource_period
     response.should be_success
   end

   it "should find the right resource period" do
      get :show, :id => @resource_period
      assigns(:resource_period).should == @resource_period
   end

   it "should have the right title" do
      get :show, :id => @resource_period
      response.should have_selector("title", :content => "Show Resources Periods")
   end

 end


 describe "GET 'edit'" do

   before(:each) do
     @resource_period = Factory(:resource_period)
   end

   it "should be successful" do
     get :edit, :id => @resource_period
     response.should be_success
   end

   it "should find the right resource_period" do
      get :edit, :id => @resource_period
      assigns(:resource_period).should == @resource_period
   end

   it "should have the right title" do
     get :edit, :id => @resource_period
     response.should have_selector("title", :content => "Edit Resources Periods")
   end

 end

 describe "POST 'create'" do

   describe "failure" do
     before(:each) do
         @attr = { :capacity => "", :resource_id => "", :period_id => "" }
     end

     it "should not create a resource period" do
         lambda do
           post :create, :resource_period => @attr
         end.should_not change(ResourcePeriod, :count)
     end

     it "should render the 'new' page" do
         post :create, :resource_period => @attr
         response.should render_template('new')
     end

     it "should have the right title" do
         post :create, :resource_period => @attr
         response.should have_selector("title", :content => "")
       end
   end

  describe "success" do
    before(:each) do
        @attr = { :capacity => "2", :resource_id => "2", :period_id => "2" }
    end

    it "should create a resource period" do
        lambda do
          post :create, :resource_period => @attr
        end.should change(ResourcePeriod, :count).by(1)
    end

    it "should redirect to the resource period show page" do
        post :create, :resource_period => @attr
        response.should redirect_to(resource_period_path(assigns(:resource_period)))
    end

    it "should have a flash message" do
        post :create, :resource_period => @attr
        flash[:notice].should =~ /Resource period was successfully created./i
    end
  end

 end

  describe "PUT 'update'" do
     before(:each) do
       @resource_period = Factory(:resource_period)
     end

     describe "failure" do

       before(:each) do
          @attr = { :capacity => "", :resource_id => "", :period_id => "" }
       end

       it "should render the 'edit' page" do
         put :update, :id => @resource_period, :resource_period => @attr
         response.should render_template('edit')
       end

       it "should have the right title" do
         put :update, :id  => @resource_period, :resource_period => @attr
         response.should have_selector("title", :content => "")
       end
     end

     describe "success" do

       before(:each) do
          @attr = { :capacity => "2", :resource_id => "2", :period_id => "2" }
       end

       it "should change the resource periods attributes " do
         put :update, :id => @resource_period, :resource_period => @attr
         @resource_period.reload
         @resource_period.capacity == @attr[:capacity]
         @resource_period.resource_id == @attr[:resource_id]
         @resource_period.period_id == @attr[:period_id]
       end

       it "should redirect the show page" do
         put :update, :id => @resource_period, :resource_period => @attr
         response.should redirect_to(resource_period_path(@resource_period))
       end

       it "should have a flash message" do
         put :update, :id => @resource_period, :resource_period => @attr
         flash[:notice].should =~ /Resource period was successfully updated./i
      end
     end
  end

  describe "DELETE 'destroy'" do
     before(:each) do
       @resource_period = Factory(:resource_period)
     end

     it "should destroy the resource period" do
       lambda do
         delete :destroy, :id => @resource_period
       end.should change(ResourcePeriod, :count).by(-1)
     end

     it "should redirect the resource period page" do
         delete :destroy, :id => @resource_period
         response.should redirect_to(resource_periods_path)
     end
  end

end
