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


  def valid_attributes
    {:coefficient => "2", :follower_id => "1", :product_id => "2"}
  end

  describe "GET index" do
    it "assigns all follower_products as @follower_products" do
      follower_product = FollowerProduct.create! valid_attributes
      get :index
      assigns(:follower_products).should eq([follower_product])
    end
  end

  describe "GET show" do
    it "assigns the requested follower_product as @follower_product" do
      follower_product = FollowerProduct.create! valid_attributes
      get :show, :id => follower_product.id.to_s
      assigns(:follower_product).should eq(follower_product)
    end
  end

  describe "GET new" do
    it "assigns a new follower_product as @follower_product" do
      get :new
      assigns(:follower_product).should be_a_new(FollowerProduct)
    end
  end

  describe "GET edit" do
    it "assigns the requested follower_product as @follower_product" do
      follower_product = FollowerProduct.create! valid_attributes
      get :edit, :id => follower_product.id.to_s
      assigns(:follower_product).should eq(follower_product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FollowerProduct" do
        expect {
          post :create, :follower_product => valid_attributes
        }.to change(FollowerProduct, :count).by(1)
      end

      it "assigns a newly created follower_product as @follower_product" do
        post :create, :follower_product => valid_attributes
        assigns(:follower_product).should be_a(FollowerProduct)
        assigns(:follower_product).should be_persisted
      end

      it "redirects to the created follower_product" do
        post :create, :follower_product => valid_attributes
        response.should redirect_to(FollowerProduct.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved follower_product as @follower_product" do
        # Trigger the behavior that occurs when invalid params are submitted
        FollowerProduct.any_instance.stub(:save).and_return(false)
        post :create, :follower_product => {}
        assigns(:follower_product).should be_a_new(FollowerProduct)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FollowerProduct.any_instance.stub(:save).and_return(false)
        post :create, :follower_product => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested follower_product" do
        follower_product = FollowerProduct.create! valid_attributes
        # Assuming there are no other follower_products in the database, this
        # specifies that the FollowerProduct created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FollowerProduct.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => follower_product.id, :follower_product => {'these' => 'params'}
      end

      it "assigns the requested follower_product as @follower_product" do
        follower_product = FollowerProduct.create! valid_attributes
        put :update, :id => follower_product.id, :follower_product => valid_attributes
        assigns(:follower_product).should eq(follower_product)
      end

      it "redirects to the follower_product" do
        follower_product = FollowerProduct.create! valid_attributes
        put :update, :id => follower_product.id, :follower_product => valid_attributes
        response.should redirect_to(follower_product)
      end
    end

    describe "with invalid params" do
      it "assigns the follower_product as @follower_product" do
        follower_product = FollowerProduct.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FollowerProduct.any_instance.stub(:save).and_return(false)
        put :update, :id => follower_product.id.to_s, :follower_product => {}
        assigns(:follower_product).should eq(follower_product)
      end

      it "re-renders the 'edit' template" do
        follower_product = FollowerProduct.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FollowerProduct.any_instance.stub(:save).and_return(false)
        put :update, :id => follower_product.id.to_s, :follower_product => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested follower_product" do
      follower_product = FollowerProduct.create! valid_attributes
      expect {
        delete :destroy, :id => follower_product.id.to_s
      }.to change(FollowerProduct, :count).by(-1)
    end

    it "redirects to the follower_products list" do
      follower_product = FollowerProduct.create! valid_attributes
      delete :destroy, :id => follower_product.id.to_s
      response.should redirect_to(follower_products_url)
    end
  end

end
