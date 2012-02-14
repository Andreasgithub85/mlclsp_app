require 'spec_helper'

describe ProductsController do
   render_views


 describe "GET 'index'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
    response.should have_selector("title",
                    :content =>  "Listing Products")
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
                                  :content => "New Products")
    end

  end


 describe "GET 'show'" do

   before(:each) do
      @product = Factory(:product)
    end

   it "should be successful" do
     get :show, :id => @product
     response.should be_success
   end

   it "should find the right product" do
      get :show, :id => @product
      assigns(:product).should == @product
   end

   it "should have the right title" do
      get :show, :id => @product
      response.should have_selector("title", :content => "Show Products")
   end

 end


 describe "GET 'edit'" do

   before(:each) do
     @product = Factory(:product)
   end

   it "should be successful" do
     get :edit, :id => @product
     response.should be_success
   end

   it "should find the right product" do
      get :edit, :id => @product
      assigns(:product).should == @product
   end

   it "should have the right title" do
     get :edit, :id => @product
     response.should have_selector("title", :content => "Edit Products")
   end

 end

 describe "POST 'create'" do

   describe "failure" do
     before(:each) do
         @attr = { :product_name => "", :leadtime_shift => "", :resource => "", :setup_time => "", :setup_cost => "",
                   :storage_cost => "", :working_time => "", :start_inventory => ""}
     end

     it "should not create a product" do
         lambda do
           post :create, :product => @attr
         end.should_not change(Product, :count)
     end

     it "should render the 'new' page" do
         post :create, :product => @attr
         response.should render_template('new')
     end

     it "should have the right title" do
         post :create, :product => @attr
         response.should have_selector("title", :content => "")
       end
   end

  describe "success" do
    before(:each) do
         @attr = { :product_name => "2", :leadtime_shift => "2", :resource => "2", :setup_time => "2", :setup_cost => "2",
                   :storage_cost => "2", :working_time => "2", :start_inventory => "2"}
    end

    it "should create a product" do
        lambda do
          post :create, :product => @attr
        end.should change(Product, :count).by(1)
    end

    it "should redirect to the product show page" do
        post :create, :product => @attr
        response.should redirect_to(product_path(assigns(:product)))
    end

    it "should have a flash message" do
        post :create, :product => @attr
        flash[:notice].should =~ /Product was successfully created./i
    end
  end

 end

  describe "PUT 'update'" do
     before(:each) do
       @product = Factory(:product)
     end

     describe "failure" do

       before(:each) do
           @attr = { :product_name => "", :leadtime_shift => "", :resource => "", :setup_time => "", :setup_cost => "",
                   :storage_cost => "", :working_time => "", :start_inventory => ""}
       end

       it "should render the 'edit' page" do
         put :update, :id => @product, :product => @attr
         response.should render_template('edit')
       end

       it "should have the right title" do
         put :update, :id  => @product, :product => @attr
         response.should have_selector("title", :content => "")
       end
     end

     describe "success" do

       before(:each) do
           @attr = { :product_name => "2", :leadtime_shift => "2", :resource => "2", :setup_time => "2", :setup_cost => "2",
                   :storage_cost => "2", :working_time => "2", :start_inventory => "2"}
       end

       it "should change the products attributes " do
         put :update, :id => @product, :product => @attr
         @product.reload
         @product.product_name == @attr[:product_name]
         @product.leadtime_shift == @attr[:leadtime_shift]
         @product.resource == @attr[:resource]
         @product.setup_time == @attr[:setup_time]
         @product.setup_cost == @attr[:setup_cost]
         @product.storage_cost == @attr[:storage_cost]
         @product.working_time == @attr[:working_time]
         @product.start_inventory == @attr[:start_inventory]
       end

       it "should redirect the show page" do
         put :update, :id => @product, :product => @attr
         response.should redirect_to(product_path(@product))
       end

       it "should have a flash message" do
         put :update, :id => @product, :product => @attr
         flash[:notice].should =~ /Product was successfully updated./i
      end
     end
  end

  describe "DELETE 'destroy'" do
     before(:each) do
       @product = Factory(:product)
     end

     it "should destroy the product" do
       lambda do
         delete :destroy, :id => @product
       end.should change(Product, :count).by(-1)
     end

     it "should redirect the product page" do
         delete :destroy, :id => @product
         response.should redirect_to(products_path)
     end
  end

end
