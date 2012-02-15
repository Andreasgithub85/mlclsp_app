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

end
