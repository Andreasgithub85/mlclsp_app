require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ResourcePeriodsController do

  # This should return the minimal set of attributes required to create a valid
  # ResourcePeriod. As you add validations to ResourcePeriod, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
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