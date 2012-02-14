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

  def valid_attributes
    { :capacity => "2", :resource_id => "2", :period_id => "2"}
  end

  describe "GET index" do
    it "assigns all resource_periods as @resource_periods" do
      resource_period = ResourcePeriod.create! valid_attributes
      get :index
      assigns(:resource_periods).should eq([resource_period])
    end
  end

  describe "GET show" do
    it "assigns the requested resource_period as @resource_period" do
      resource_period = ResourcePeriod.create! valid_attributes
      get :show, :id => resource_period.id.to_s
      assigns(:resource_period).should eq(resource_period)
    end
  end

  describe "GET new" do
    it "assigns a new resource_period as @resource_period" do
      get :new
      assigns(:resource_period).should be_a_new(ResourcePeriod)
    end
  end

  describe "GET edit" do
    it "assigns the requested resource_period as @resource_period" do
      resource_period = ResourcePeriod.create! valid_attributes
      get :edit, :id => resource_period.id.to_s
      assigns(:resource_period).should eq(resource_period)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ResourcePeriod" do
        expect {
          post :create, :resource_period => valid_attributes
        }.to change(ResourcePeriod, :count).by(1)
      end

      it "assigns a newly created resource_period as @resource_period" do
        post :create, :resource_period => valid_attributes
        assigns(:resource_period).should be_a(ResourcePeriod)
        assigns(:resource_period).should be_persisted
      end

      it "redirects to the created resource_period" do
        post :create, :resource_period => valid_attributes
        response.should redirect_to(ResourcePeriod.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved resource_period as @resource_period" do
        # Trigger the behavior that occurs when invalid params are submitted
        ResourcePeriod.any_instance.stub(:save).and_return(false)
        post :create, :resource_period => {}
        assigns(:resource_period).should be_a_new(ResourcePeriod)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ResourcePeriod.any_instance.stub(:save).and_return(false)
        post :create, :resource_period => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested resource_period" do
        resource_period = ResourcePeriod.create! valid_attributes
        # Assuming there are no other resource_periods in the database, this
        # specifies that the ResourcePeriod created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ResourcePeriod.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => resource_period.id, :resource_period => {'these' => 'params'}
      end

      it "assigns the requested resource_period as @resource_period" do
        resource_period = ResourcePeriod.create! valid_attributes
        put :update, :id => resource_period.id, :resource_period => valid_attributes
        assigns(:resource_period).should eq(resource_period)
      end

      it "redirects to the resource_period" do
        resource_period = ResourcePeriod.create! valid_attributes
        put :update, :id => resource_period.id, :resource_period => valid_attributes
        response.should redirect_to(resource_period)
      end
    end

    describe "with invalid params" do
      it "assigns the resource_period as @resource_period" do
        resource_period = ResourcePeriod.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ResourcePeriod.any_instance.stub(:save).and_return(false)
        put :update, :id => resource_period.id.to_s, :resource_period => {}
        assigns(:resource_period).should eq(resource_period)
      end

      it "re-renders the 'edit' template" do
        resource_period = ResourcePeriod.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ResourcePeriod.any_instance.stub(:save).and_return(false)
        put :update, :id => resource_period.id.to_s, :resource_period => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested resource_period" do
      resource_period = ResourcePeriod.create! valid_attributes
      expect {
        delete :destroy, :id => resource_period.id.to_s
      }.to change(ResourcePeriod, :count).by(-1)
    end

    it "redirects to the resource_periods list" do
      resource_period = ResourcePeriod.create! valid_attributes
      delete :destroy, :id => resource_period.id.to_s
      response.should redirect_to(resource_periods_url)
    end
  end

end
