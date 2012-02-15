require 'spec_helper'

describe FollowerProductsController do
  render_views

  describe "GET 'index'" do
     it "should be successful" do
       get :index
       response.should be_success
     end

     it "should have the right title" do
       get :index
     response.should have_selector("title",
                     :content =>  "Listing Products Followers")
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
                                   :content => "New Products Followers")
     end
   end


  describe "GET 'show'" do
     before(:each) do
       @follower_product = Factory(:follower_product)
     end

    it "should be successful" do
      get :show, :id => @follower_product
      response.should be_success
    end

    it "should find the right follower_product" do
       get :show, :id => @follower_product
       assigns(:follower_product).should == @follower_product
    end

    it "should have the right title" do
       get :show, :id => @follower_product
       response.should have_selector("title", :content => "Show Products Followers")
    end
  end


  describe "GET 'edit'" do
    before(:each) do
      @follower_product = Factory(:follower_product)
    end

    it "should be successful" do
      get :edit, :id => @follower_product
      response.should be_success
    end

    it "should find the right follower_product" do
       get :edit, :id => @follower_product
       assigns(:follower_product).should == @follower_product
    end

    it "should have the right title" do
      get :edit, :id => @follower_product
      response.should have_selector("title", :content => "Edit Products Followers")
    end
  end

  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
          @attr = { :coefficient => "", :follower_id => "", :product_id => "" }
      end

      it "should not create a follower_product" do
          lambda do
            post :create, :follower_product => @attr
          end.should_not change(FollowerProduct, :count)
      end

      it "should render the 'new' page" do
          post :create, :follower_product => @attr
          response.should render_template('new')
      end

      it "should have the right title" do
          post :create, :follower_product => @attr
          response.should have_selector("title", :content => "")
        end
    end

   describe "success" do
     before(:each) do
         @attr = { :coefficient => "1", :follower_id => "1", :product_id => "2" }
     end

     it "should create a follower_product" do
         lambda do
           post :create, :follower_product => @attr
         end.should change(FollowerProduct, :count).by(1)
     end

     it "should redirect to the follower_product show page" do
         post :create, :follower_product => @attr
         response.should redirect_to(follower_product_path(assigns(:follower_product)))
     end

     it "should have a flash message" do
         post :create, :follower_product => @attr
         flash[:notice].should =~ /Follower product was successfully created./i
     end
   end
  end

   describe "PUT 'update'" do
      before(:each) do
        @follower_product = Factory(:follower_product)
      end

      describe "failure" do
        before(:each) do
           @attr = { :coefficient => "", :follower_id => "", :product_id => "" }
        end

        it "should render the 'edit' page" do
          put :update, :id => @follower_product, :follower_product => @attr
          response.should render_template('edit')
        end

        it "should have the right title" do
          put :update, :id  => @follower_product, :follower_product => @attr
          response.should have_selector("title", :content => "")
        end
      end

      describe "success" do
        before(:each) do
           @attr = { :coefficient => "1", :follower_id => "1", :product_id => "7" }
        end

        it "should change the follower_products attributes " do
          put :update, :id => @follower_product, :follower_product => @attr
          @follower_product.reload
          @follower_product.coefficient == @attr[:coefficient]
          @follower_product.follower_id == @attr[:follower_id]
          @follower_product.product_id == @attr[:product_id]
        end

        it "should redirect the show page" do
          put :update, :id => @follower_product, :follower_product => @attr
          response.should redirect_to(follower_product_path(@follower_product))
        end

        it "should have a flash message" do
          put :update, :id => @follower_product, :follower_product => @attr
          flash[:notice].should =~ /Follower product was successfully updated./i
       end
      end
   end

   describe "DELETE 'destroy'" do
      before(:each) do
        @follower_product = Factory(:follower_product)
      end

      it "should destroy the follower_product" do
        lambda do
          delete :destroy, :id => @follower_product
        end.should change(FollowerProduct, :count).by(-1)
      end

      it "should redirect the follower_product page" do
          delete :destroy, :id => @follower_product
          response.should redirect_to(follower_products_path)
      end
   end

end
