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

describe PeriodsController do

  # This should return the minimal set of attributes required to create a valid
  # Period. As you add validations to Period, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
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
