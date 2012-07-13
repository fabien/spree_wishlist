class AddNotifyToWishedProducts < ActiveRecord::Migration
  def self.up
    add_column :spree_wished_products, :notify, :boolean, :default => false, :null => false
  end
 
  def self.down
    remove_column :spree_wished_products, :notify
  end
end
