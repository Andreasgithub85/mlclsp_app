require 'spec_helper'

describe PeriodsController do
  render_views


 describe "GET 'index'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
    response.should have_selector("title",
                    :content =>  "Listing Periods")
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
                                  :content => "New Periods")
    end

  end


 describe "GET 'show'" do

   before(:each) do
      @period = Factory(:period)
    end

   it "should be successful" do
     get :show, :id => @period
     response.should be_success
   end

   it "should find the right period" do
      get :show, :id => @period
      assigns(:period).should == @period
   end

   it "should have the right title" do
      get :show, :id => @period
      response.should have_selector("title", :content => "Show Periods")
   end

 end


 describe "GET 'edit'" do

   before(:each) do
     @period = Factory(:period)
   end

   it "should be successful" do
     get :edit, :id => @period
     response.should be_success
   end

   it "should find the right period" do
      get :edit, :id => @period
      assigns(:period).should == @period
   end

   it "should have the right title" do
     get :edit, :id => @period
     response.should have_selector("title", :content => "Edit Periods")
   end

 end

 describe "POST 'create'" do

   describe "failure" do
     before(:each) do
         @attr = { :period_name => "" }
     end

     it "should not create a period" do
         lambda do
           post :create, :period => @attr
         end.should_not change(Period, :count)
     end

     it "should render the 'new' page" do
         post :create, :period => @attr
         response.should render_template('new')
     end

     it "should have the right title" do
         post :create, :period => @attr
         response.should have_selector("title", :content => "")
       end
   end

  describe "success" do
    before(:each) do
        @attr = { :period_name => "1" }
    end

    it "should create a period" do
        lambda do
          post :create, :period => @attr
        end.should change(Period, :count).by(1)
    end

    it "should redirect to the period show page" do
        post :create, :period => @attr
        response.should redirect_to(period_path(assigns(:period)))
    end

    it "should have a flash message" do
        post :create, :period => @attr
        flash[:notice].should =~ /Period was successfully created./i
    end
  end

 end

  describe "PUT 'update'" do
     before(:each) do
       @period = Factory(:period)
     end

     describe "failure" do

       before(:each) do
          @attr = { :period_name => "" }
       end

       it "should render the 'edit' page" do
         put :update, :id => @period, :period => @attr
         response.should render_template('edit')
       end

       it "should have the right title" do
         put :update, :id  => @period, :period => @attr
         response.should have_selector("title", :content => "")
       end
     end

     describe "success" do

       before(:each) do
          @attr = { :period_name => "1" }
       end

       it "should change the periods attributes " do
         put :update, :id => @period, :period => @attr
         @period.reload
         @period.period_name == @attr[:period_name]
       end

       it "should redirect the show page" do
         put :update, :id => @period, :period => @attr
         response.should redirect_to(period_path(@period))
       end

       it "should have a flash message" do
         put :update, :id => @period, :period => @attr
         flash[:notice].should =~ /Period was successfully updated./i
      end
     end
  end

  describe "DELETE 'destroy'" do
     before(:each) do
       @period = Factory(:period)
     end

     it "should destroy the period" do
       lambda do
         delete :destroy, :id => @period
       end.should change(Period, :count).by(-1)
     end

     it "should redirect the period page" do
         delete :destroy, :id => @period
         response.should redirect_to(periods_path)
     end
  end

end
