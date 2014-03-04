class DeviseAddLastseenableTest < ActiveRecord::Migration
  def self.up
    add_column :messages, :sender_name, :string
  end
  
  def self.down
    remove_column :messages, :sender_name
  end
end