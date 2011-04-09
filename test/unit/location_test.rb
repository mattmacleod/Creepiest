require File.dirname(__FILE__) + '/../test_helper'

class LocationTest < ActiveSupport::TestCase

  # DB tests
  should have_db_column(:lat).of_type(:float).with_options(:null => false)
  should have_db_column(:lng).of_type(:float).with_options(:null => false)
  should have_db_column(:location_time).of_type(:datetime).with_options(:null => false)
  
  # Other model tests
  should belong_to :account
  
end
