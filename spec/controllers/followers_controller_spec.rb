require 'spec_helper'

describe FollowersController do
  render_views

  describe "GET 'index'" do

     it "should be successful" do
       get :index
       response.should be_success
     end

     it "should have the right title" do
       get :index
       response.should have_selector("title",
                     :content =>  "Listing Followers")
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
                                   :content => "New Followers")
     end

   end


  describe "GET 'show'" do

    before(:each) do
       @follower = Factory(:follower)
     end

    it "should be successful" do
      get :show, :id => @follower
      response.should be_success
    end

    it "should find the right follower" do
       get :show, :id => @follower
       assigns(:follower).should == @follower
    end

    it "should have the right title" do
       get :show, :id => @follower
       response.should have_selector("title", :content => "Show Followers")
    end

  end


  describe "GET 'edit'" do

    before(:each) do
      @follower = Factory(:follower)
    end

    it "should be successful" do
      get :edit, :id => @follower
      response.should be_success
    end

    it "should find the right follower" do
       get :edit, :id => @follower
       assigns(:follower).should == @follower
    end

    it "should have the right title" do
      get :edit, :id => @follower
      response.should have_selector("title", :content => "Edit Followers")
    end

  end

  describe "POST 'create'" do

    describe "failure" do
      before(:each) do
          @attr = { :follower_name => "" }
      end

      it "should not create a follower" do
          lambda do
            post :create, :follower => @attr
          end.should_not change(Follower, :count)
      end

      it "should render the 'new' page" do
          post :create, :follower => @attr
          response.should render_template('new')
      end

      it "should have the right title" do
          post :create, :follower => @attr
          response.should have_selector("title", :content => "")
        end
    end

   describe "success" do
     before(:each) do
         @attr = { :follower_name => "1" }
     end

     it "should create a follower" do
         lambda do
           post :create, :follower => @attr
         end.should change(Follower, :count).by(1)
     end

     it "should redirect to the follower show page" do
         post :create, :follower => @attr
         response.should redirect_to(follower_path(assigns(:follower)))
     end

     it "should have a flash message" do
         post :create, :follower => @attr
         flash[:notice].should =~ /Follower was successfully created./i
     end
   end

  end

   describe "PUT 'update'" do
      before(:each) do
        @follower = Factory(:follower)
      end

      describe "failure" do

        before(:each) do
           @attr = { :follower_name => "" }
        end

        it "should render the 'edit' page" do
          put :update, :id => @follower, :follower => @attr
          response.should render_template('edit')
        end

        it "should have the right title" do
          put :update, :id  => @follower, :follower => @attr
          response.should have_selector("title", :content => "")
        end
      end

      describe "success" do

        before(:each) do
           @attr = { :follower_name => "1" }
        end

        it "should change the followers attributes " do
          put :update, :id => @follower, :follower => @attr
          @follower.reload
          @follower.follower_name == @attr[:follower_name]
        end

        it "should redirect the show page" do
          put :update, :id => @follower, :follower => @attr
          response.should redirect_to(follower_path(@follower))
        end

        it "should have a flash message" do
          put :update, :id => @follower, :follower => @attr
          flash[:notice].should =~ /Follower was successfully updated./i
       end
      end
   end

   describe "DELETE 'destroy'" do
      before(:each) do
        @follower = Factory(:follower)
      end

      it "should destroy the follower" do
        lambda do
          delete :destroy, :id => @follower
        end.should change(Follower, :count).by(-1)
      end

      it "should redirect the follower page" do
          delete :destroy, :id => @follower
          response.should redirect_to(followers_path)
      end
   end



  def valid_attributes
    { :follower_name => "1"}
  end

  describe "GET index" do
    it "assigns all followers as @followers" do
      follower = Follower.create! valid_attributes
      get :index
      assigns(:followers).should eq([follower])
    end
  end

  describe "GET show" do
    it "assigns the requested follower as @follower" do
      follower = Follower.create! valid_attributes
      get :show, :id => follower.id.to_s
      assigns(:follower).should eq(follower)
    end
  end

  describe "GET new" do
    it "assigns a new follower as @follower" do
      get :new
      assigns(:follower).should be_a_new(Follower)
    end
  end

  describe "GET edit" do
    it "assigns the requested follower as @follower" do
      follower = Follower.create! valid_attributes
      get :edit, :id => follower.id.to_s
      assigns(:follower).should eq(follower)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Follower" do
        expect {
          post :create, :follower => valid_attributes
        }.to change(Follower, :count).by(1)
      end

      it "assigns a newly created follower as @follower" do
        post :create, :follower => valid_attributes
        assigns(:follower).should be_a(Follower)
        assigns(:follower).should be_persisted
      end

      it "redirects to the created follower" do
        post :create, :follower => valid_attributes
        response.should redirect_to(Follower.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved follower as @follower" do
        # Trigger the behavior that occurs when invalid params are submitted
        Follower.any_instance.stub(:save).and_return(false)
        post :create, :follower => {}
        assigns(:follower).should be_a_new(Follower)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Follower.any_instance.stub(:save).and_return(false)
        post :create, :follower => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested follower" do
        follower = Follower.create! valid_attributes
        # Assuming there are no other followers in the database, this
        # specifies that the Follower created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Follower.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => follower.id, :follower => {'these' => 'params'}
      end

      it "assigns the requested follower as @follower" do
        follower = Follower.create! valid_attributes
        put :update, :id => follower.id, :follower => valid_attributes
        assigns(:follower).should eq(follower)
      end

      it "redirects to the follower" do
        follower = Follower.create! valid_attributes
        put :update, :id => follower.id, :follower => valid_attributes
        response.should redirect_to(follower)
      end
    end

    describe "with invalid params" do
      it "assigns the follower as @follower" do
        follower = Follower.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Follower.any_instance.stub(:save).and_return(false)
        put :update, :id => follower.id.to_s, :follower => {}
        assigns(:follower).should eq(follower)
      end

      it "re-renders the 'edit' template" do
        follower = Follower.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Follower.any_instance.stub(:save).and_return(false)
        put :update, :id => follower.id.to_s, :follower => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested follower" do
      follower = Follower.create! valid_attributes
      expect {
        delete :destroy, :id => follower.id.to_s
      }.to change(Follower, :count).by(-1)
    end

    it "redirects to the followers list" do
      follower = Follower.create! valid_attributes
      delete :destroy, :id => follower.id.to_s
      response.should redirect_to(followers_url)
    end
  end

end
