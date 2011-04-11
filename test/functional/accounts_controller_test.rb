require File.dirname(__FILE__) + '/../test_helper'

class AccountsControllerTest < ActionController::TestCase

  # Routing
  should "have correct routing" do
    assert_routing "/show/1", { :controller=>"accounts", :action=>"show", :id => "1" }
    assert_routing "/show/1/locations.json", { :controller=>"accounts", :action=>"locations", :id => "1" }
  end
  
  context "with no existing accounts" do
    
    context "a post to :search with valid parameters" do
      setup { post :search, :account_name => "matt_macleod", :account_type => "twitter" }
      should "create a new account record" do
        assert_equal 1, Account.count
        assert_equal "matt_macleod", Account.first.name
        assert_equal "twitter", Account.first.account_type
      end
      should respond_with :redirect
      should redirect_to("Show page"){ show_path(:id => Account.first.id) }
    end
    
    context "a post to :search with invalid parameters" do
      setup { post :search, :account_name => "", :account_type => "" }
      should "not create a new account record" do
        assert_equal 0, Account.count
      end
      should respond_with :redirect
    end
    
  end
  
  
  context "with an existing account" do
    
    setup do
      @account = Factory(:account, :name => "matt_macleod", :account_type => "twitter" )
    end
    
    context "a post to :search with details of an existing account" do
      setup { post :search, :account_name => "matt_macleod", :account_type => "twitter" }
      should "not create a new account record" do
        assert_equal 1, Account.count
      end
      should respond_with :redirect
      should redirect_to("Show page"){ show_path(:id => Account.first.id) }
    end
    
    context "a get to show for that account" do
      setup { get :show, :id => @account.id }
      should "load the account" do
        assert_equal @account, assigns(:account)
      end
      should respond_with :success
      should render_template :show
    end
    
    context "a get to show for a nonexistent account" do
      setup { get :show, :id => 99898999 }
      should respond_with :redirect
      should redirect_to("404 page"){ "/404.html" }
    end
    
    context "with locations" do
      setup do
        @locations = [
          @location1 = Factory(:location, :account => @account, :location_time => 2.years.ago, :lat => 2.0),
          @location2 = Factory(:location, :account => @account, :location_time => 1.year.ago, :lat => 1.0)
        ]
      end
      context "a get to :locations for that account" do
        setup { get :locations, :id => @account.id, :format => :json }
        should respond_with :success
        should "return locations as JSON in correct date order" do
          locations = JSON.parse(@response.body)
          assert_equal 2.0, locations[0]["location"]["lat"]
          assert_equal 1.0, locations[1]["location"]["lat"]
        end
      end
    end
    
  end
  
end
