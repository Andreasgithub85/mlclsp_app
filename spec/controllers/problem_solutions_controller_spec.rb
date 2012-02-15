require 'spec_helper'

describe ProblemSolutionsController do
   render_views

   describe "GET 'index'" do
     it "should be successful" do
       get 'index'
       response.should be_success
     end
   end

   it "should have the right title" do
     get :index
     response.should have_selector("title",
                    :content =>  "Data Input & Solution")
   end

   describe "GET 'optimize'" do
    it "should be successful" do
      get 'optimize'
      response.should be_success
    end
   end

   describe "GET 'read_production_inventory_quantities'" do
    it "should be successful" do
      get 'read_production_inventory_quantities'
      response.should be_success
    end
   end

   describe "GET 'delete_production_quantities'" do
    it "should be successful" do
      get 'delete_production_quantities'
      response.should be_success
    end
   end

   describe "GET 'read_and_show_ofv'" do
    it "should be successful" do
      get 'read_and_show_ofv'
      response.should be_success
    end
   end
end
