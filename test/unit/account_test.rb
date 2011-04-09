require File.dirname(__FILE__) + '/../test_helper'

class AccountTest < ActiveSupport::TestCase

  # DB tests
  should have_db_column(:account_type).of_type(:string).with_options(:null => false)
  should have_db_column(:name).of_type(:string).with_options(:null => false)
  should have_db_column(:synced_at).of_type(:datetime)
  
  # Relationships
  should have_many :locations
  
  # Validations
  should allow_value("twitter").for(:account_type)
  should_not allow_value("anythingelse").for(:account_type)
  
  context "an account" do
    setup{ @account = Factory(:account) }
    should validate_uniqueness_of(:name).scoped_to(:account_type)
  end

end
