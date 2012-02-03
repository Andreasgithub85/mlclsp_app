require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Produkte page at '/produkte'" do
    get '/produkte'
    response.should have_selector('title', :content => "Produkte")
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end

 # it "should have a Help page at '/help'" do
 #   get '/help'
 #   response.should have_selector('title', :content => "Help")
 # end
end