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

  def valid_attributes
    { :period_name => "2"}
  end

  describe "GET index" do
    it "assigns all periods as @periods" do
      period = Period.create! valid_attributes
      get :index
      assigns(:periods).should eq([period])
    end
  end

  describe "GET show" do
    it "assigns the requested period as @period" do
      period = Period.create! valid_attributes
      get :show, :id => period.id.to_s
      assigns(:period).should eq(period)
    end
  end

  describe "GET new" do
    it "assigns a new period as @period" do
      get :new
      assigns(:period).should be_a_new(Period)
    end
  end

  describe "GET edit" do
    it "assigns the requested period as @period" do
      period = Period.create! valid_attributes
      get :edit, :id => period.id.to_s
      assigns(:period).should eq(period)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Period" do
        expect {
          post :create, :period => valid_attributes
        }.to change(Period, :count).by(1)
      end

      it "assigns a newly created period as @period" do
        post :create, :period => valid_attributes
        assigns(:period).should be_a(Period)
        assigns(:period).should be_persisted
      end

      it "redirects to the created period" do
        post :create, :period => valid_attributes
        response.should redirect_to(Period.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved period as @period" do
        # Trigger the behavior that occurs when invalid params are submitted
        Period.any_instance.stub(:save).and_return(false)
        post :create, :period => {}
        assigns(:period).should be_a_new(Period)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Period.any_instance.stub(:save).and_return(false)
        post :create, :period => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested period" do
        period = Period.create! valid_attributes
        # Assuming there are no other periods in the database, this
        # specifies that the Period created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Period.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => period.id, :period => {'these' => 'params'}
      end

      it "assigns the requested period as @period" do
        period = Period.create! valid_attributes
        put :update, :id => period.id, :period => valid_attributes
        assigns(:period).should eq(period)
      end

      it "redirects to the period" do
        period = Period.create! valid_attributes
        put :update, :id => period.id, :period => valid_attributes
        response.should redirect_to(period)
      end
    end

    describe "with invalid params" do
      it "assigns the period as @period" do
        period = Period.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Period.any_instance.stub(:save).and_return(false)
        put :update, :id => period.id.to_s, :period => {}
        assigns(:period).should eq(period)
      end

      it "re-renders the 'edit' template" do
        period = Period.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Period.any_instance.stub(:save).and_return(false)
        put :update, :id => period.id.to_s, :period => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested period" do
      period = Period.create! valid_attributes
      expect {
        delete :destroy, :id => period.id.to_s
      }.to change(Period, :count).by(-1)
    end

    it "redirects to the periods list" do
      period = Period.create! valid_attributes
      delete :destroy, :id => period.id.to_s
      response.should redirect_to(periods_url)
    end
  end

end
