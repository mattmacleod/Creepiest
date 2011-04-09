require File.dirname(__FILE__) + '/../test_helper'

class HomeControllerTest < ActionController::TestCase
  
  # Routing
  should "have correct routing" do
    assert_routing "/",              { :controller=>"home", :action=>"index" }
  end
  
  context "a get to :index" do
    setup { get :index }
    should respond_with :success
    should render_template :index
    should "show search form" do
      assert_select "form", 1
      assert_select "input#account_name", 1
      assert_select "select#account_type", 1
      assert_select "input.submit", 1
    end
  end
  
end
