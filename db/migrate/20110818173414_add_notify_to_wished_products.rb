class AddNotifyToWishedProducts < ActiveRecord::Migration
  def self.up
    add_column :wished_products, :notify, :boolean, :default => false, :null => false
  end
 
  def self.down
    remove_column :wished_products, :notify
  end
end
