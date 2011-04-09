class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :account_type, :null => false
      t.string :name, :null => false
      t.datetime :synced_at
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
