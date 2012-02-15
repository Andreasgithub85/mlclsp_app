require 'spec_helper'

describe DemandsController do
  render_views

 describe "GET 'index'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
    response.should have_selector("title",
                    :content =>  "Listing Demands")
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
                                  :content => "New Demands")
    end

  end


 describe "GET 'show'" do

   before(:each) do
      @demand = Factory(:demand)
    end

   it "should be successful" do
     get :show, :id => @demand
     response.should be_success
   end

   it "should find the right demand" do
      get :show, :id => @demand
      assigns(:demand).should == @demand
   end

   it "should have the right title" do
      get :show, :id => @demand
      response.should have_selector("title", :content => "Show Demands")
   end

 end


 describe "GET 'edit'" do

   before(:each) do
     @demand = Factory(:demand)
   end

   it "should be successful" do
     get :edit, :id => @demand
     response.should be_success
   end

   it "should find the right demand" do
      get :edit, :id => @demand
      assigns(:demand).should == @demand
   end

   it "should have the right title" do
     get :edit, :id => @demand
     response.should have_selector("title", :content => "Edit Demands")
   end

 end

 describe "POST 'create'" do

   describe "failure" do
     before(:each) do
         @attr = { :product_id => "", :period_id => "", :demand_quantity => "" }
     end

     it "should not create a demand" do
         lambda do
           post :create, :demand => @attr
         end.should_not change(Demand, :count)
     end

     it "should render the 'new' page" do
         post :create, :demand => @attr
         response.should render_template('new')
     end

     it "should have the right title" do
         post :create, :demand => @attr
         response.should have_selector("title", :content => "")
       end
   end

  describe "success" do
    before(:each) do
        @attr = { :product_id => "1", :period_id => "1", :demand_quantity => "1" }
    end

    it "should create a demand" do
        lambda do
          post :create, :demand => @attr
        end.should change(Demand, :count).by(1)
    end

    it "should redirect to the demand show page" do
        post :create, :demand => @attr
        response.should redirect_to(demand_path(assigns(:demand)))
    end

    it "should have a flash message" do
        post :create, :demand => @attr
        flash[:notice].should =~ /Demand was successfully created./i
    end
  end

 end

  describe "PUT 'update'" do
     before(:each) do
       @demand = Factory(:demand)
     end

     describe "failure" do

       before(:each) do
          @attr = { :product_id => "", :period_id => "", :demand_quantity => "" }
       end

       it "should render the 'edit' page" do
         put :update, :id => @demand, :demand => @attr
         response.should render_template('edit')
       end

       it "should have the right title" do
         put :update, :id  => @demand, :demand => @attr
         response.should have_selector("title", :content => "")
       end
     end

     describe "success" do

       before(:each) do
          @attr = { :product_id => "1", :period_id => "1", :demand_quantity => "7" }
       end

       it "should change the demands attributes " do
         put :update, :id => @demand, :demand => @attr
         @demand.reload
         @demand.product_id == @attr[:product_id]
         @demand.period_id == @attr[:product_id]
         @demand.demand_quantity == @attr[:demand_quantity]
       end

       it "should redirect the show page" do
         put :update, :id => @demand, :demand => @attr
         response.should redirect_to(demand_path(@demand))
       end

       it "should have a flash message" do
         put :update, :id => @demand, :demand => @attr
         flash[:notice].should =~ /Demand was successfully updated./i
      end
     end
  end

  describe "DELETE 'destroy'" do
     before(:each) do
       @demand = Factory(:demand)
     end

     it "should destroy the demand" do
       lambda do
         delete :destroy, :id => @demand
       end.should change(Demand, :count).by(-1)
     end

     it "should redirect the demand page" do
         delete :destroy, :id => @demand
         response.should redirect_to(demands_path)
     end
  end

end
