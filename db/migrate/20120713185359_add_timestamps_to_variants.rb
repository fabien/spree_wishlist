class AddTimestampsToVariants < ActiveRecord::Migration
  def self.up
    add_column :spree_variants, :created_at, :datetime
    add_column :spree_variants, :updated_at, :datetime
    Spree::Variant.all.each { |v| v.update_attributes(:created_at => v.product.created_at, :updated_at => v.product.updated_at) }
  end
 
  def self.down
    remove_column :spree_variants, :created_at
    remove_column :spree_variants, :updated_at
  end
end