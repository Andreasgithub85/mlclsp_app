require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end


  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end

  it "should have a data input & solution page at '/problem_solutions'" do
    get '/problem_solutions'
    response.should have_selector('title', :content => "Data Input & Solution")
  end

  it "should have a resource page at '/resources'" do
    get '/resources'
    response.should have_selector('title', :content => "Listing Resources")
  end

  it "should have a product page at '/products'" do
    get '/products'
    response.should have_selector('title', :content => "Listing Products")
  end

  it "should have a follower page at '/followers'" do
    get '/followers'
    response.should have_selector('title', :content => "Listing Followers")
  end

  it "should have a dependency page at '/follower_products'" do
    get '/follower_products'
    response.should have_selector('title', :content => "Listing Products Followers")
  end

  it "should have a period page at '/periods'" do
    get '/periods'
    response.should have_selector('title', :content => "Listing Periods")
  end

  it "should have a demand page at '/demands'" do
    get '/demands'
    response.should have_selector('title', :content => "Listing Demands")
  end

  it "should have a resource capacity page at '/resource_periods'" do
    get '/resource_periods'
    response.should have_selector('title', :content => "Listing Resources Periods")
  end


  describe "when not signed in" do

    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign in")
    end

    it "should have a home link" do
      visit root_path
      response.should have_selector("a", :href => root_path,
                                         :content => "Home")
    end

  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Sign out")
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
    end

    it "should have a mlclsp link" do
      visit root_path
      response.should have_selector("a", :href => problem_solutions_path)

    end

  end

end