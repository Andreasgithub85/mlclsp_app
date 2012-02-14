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


  def valid_attributes
    {:product_id => "1", :period_id => "1", :demand_quantity => "5"}
  end

  describe "GET show" do
    it "assigns the requested demand as @demand" do
      demand = Demand.create! valid_attributes
      get :show, :id => demand.id.to_s
      assigns(:demand).should eq(demand)
    end
  end

  describe "GET new" do
    it "assigns a new demand as @demand" do
      get :new
      assigns(:demand).should be_a_new(Demand)
    end
  end

  describe "GET edit" do
    it "assigns the requested demand as @demand" do
      demand = Demand.create! valid_attributes
      get :edit, :id => demand.id.to_s
      assigns(:demand).should eq(demand)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new demand" do
        expect {
          post :create, :demand => valid_attributes
        }.to change(Demand, :count).by(1)
      end

      it "assigns a newly created demand as @demand" do
        post :create, :demand => valid_attributes
        assigns(:demand).should be_a(Demand)
        assigns(:demand).should be_persisted
      end

      it "redirects to the created demand" do
        post :create, :demand => valid_attributes
        response.should redirect_to(Demand.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved demand as @demand" do
        # Trigger the behavior that occurs when invalid params are submitted
        Demand.any_instance.stub(:save).and_return(false)
        post :create, :demand => {}
        assigns(:demand).should be_a_new(Demand)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Demand.any_instance.stub(:save).and_return(false)
        post :create, :demand => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested demand" do
        demand = Demand.create! valid_attributes
        # Assuming there are no other demands in the database, this
        # specifies that the demand created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Demand.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => demand.id, :demand => {'these' => 'params'}
      end

      it "assigns the requested demand as @demand" do
        demand = Demand.create! valid_attributes
        put :update, :id => demand.id, :demand => valid_attributes
        assigns(:demand).should eq(demand)
      end

      it "redirects to the demand" do
        demand = Demand.create! valid_attributes
        put :update, :id => demand.id, :demand => valid_attributes
        response.should redirect_to(demand)
      end
    end

    describe "with invalid params" do
      it "assigns the demand as @demand" do
        demand = Demand.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Demand.any_instance.stub(:save).and_return(false)
        put :update, :id => demand.id.to_s, :demand => {}
        assigns(:demand).should eq(demand)
      end

      it "re-renders the 'edit' template" do
        demand = Demand.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Demand.any_instance.stub(:save).and_return(false)
        put :update, :id => demand.id.to_s, :demand => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested demand" do
      demand = Demand.create! valid_attributes
      expect {
        delete :destroy, :id => demand.id.to_s
      }.to change(Demand, :count).by(-1)
    end

    it "redirects to the demands list" do
      demand = Demand.create! valid_attributes
      delete :destroy, :id => demand.id.to_s
      response.should redirect_to(demands_url)
    end
  end


end
