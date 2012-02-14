require 'spec_helper'

describe ResourcesController do
   render_views


 describe "GET 'index'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
    response.should have_selector("title",
                    :content =>  "Listing Resources")
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
                                  :content => "New Resources")
    end

  end


 describe "GET 'show'" do

   before(:each) do
      @resource = Factory(:resource)
    end

   it "should be successful" do
     get :show, :id => @resource
     response.should be_success
   end

   it "should find the right resource" do
      get :show, :id => @resource
      assigns(:resource).should == @resource
   end

   it "should have the right title" do
      get :show, :id => @resource
      response.should have_selector("title", :content => "Show Resources")
   end

 end


 describe "GET 'edit'" do

   before(:each) do
     @resource = Factory(:resource)
   end

   it "should be successful" do
     get :edit, :id => @resource
     response.should be_success
   end

   it "should find the right resource" do
      get :edit, :id => @resource
      assigns(:resource).should == @resource
   end

   it "should have the right title" do
     get :edit, :id => @resource
     response.should have_selector("title", :content => "Edit Resources")
   end

 end

 describe "POST 'create'" do

   describe "failure" do
     before(:each) do
         @attr = { :resource_name => "" }
     end

     it "should not create a resource" do
         lambda do
           post :create, :resource => @attr
         end.should_not change(Resource, :count)
     end

     it "should render the 'new' page" do
         post :create, :resource => @attr
         response.should render_template('new')
     end

     it "should have the right title" do
         post :create, :resource => @attr
         response.should have_selector("title", :content => "")
       end
   end

  describe "success" do
    before(:each) do
        @attr = { :resource_name => "1"}
    end

    it "should create a resource" do
        lambda do
          post :create, :resource => @attr
        end.should change(Resource, :count).by(1)
    end

    it "should redirect to the resource show page" do
        post :create, :resource => @attr
        response.should redirect_to(resource_path(assigns(:resource)))
    end

    it "should have a flash message" do
        post :create, :resource => @attr
        flash[:notice].should =~ /Resource was successfully created./i
    end
  end

 end

  describe "PUT 'update'" do
     before(:each) do
       @resource = Factory(:resource)
     end

     describe "failure" do

       before(:each) do
          @attr = { :resource_name => "" }
       end

       it "should render the 'edit' page" do
         put :update, :id => @resource, :resource => @attr
         response.should render_template('edit')
       end

       it "should have the right title" do
         put :update, :id  => @resource, :resource => @attr
         response.should have_selector("title", :content => "")
       end
     end

     describe "success" do

       before(:each) do
          @attr = { :resource_name => "2"}
       end

       it "should change the resources attributes " do
         put :update, :id => @resource, :resource => @attr
         @resource.reload
         @resource.resource_name == @attr[:resource_name]
       end

       it "should redirect the show page" do
         put :update, :id => @resource, :resource => @attr
         response.should redirect_to(resource_path(@resource))
       end

       it "should have a flash message" do
         put :update, :id => @resource, :resource => @attr
         flash[:notice].should =~ /Resource was successfully updated./i
      end
     end
  end

  describe "DELETE 'destroy'" do
     before(:each) do
       @resource = Factory(:resource)
     end

     it "should destroy the resource" do
       lambda do
         delete :destroy, :id => @resource
       end.should change(Resource, :count).by(-1)
     end

     it "should redirect the resource page" do
         delete :destroy, :id => @resource
         response.should redirect_to(resources_path)
     end
  end

end
