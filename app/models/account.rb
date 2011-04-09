class Account < ActiveRecord::Base
  
  # Relationships
  has_many :locations
  
  # Validations
  validates_uniqueness_of :name, :scope => :account_type
  
end
