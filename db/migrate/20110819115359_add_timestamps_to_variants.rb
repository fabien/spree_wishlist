class AddTimestampsToVariants < ActiveRecord::Migration
  def self.up
    add_column :variants, :created_at, :datetime
    add_column :variants, :updated_at, :datetime
    Variant.all.each { |v| v.update_attributes(:created_at => v.product.created_at, :updated_at => v.product.updated_at) }
  end
 
  def self.down
    remove_column :variants, :created_at
    remove_column :variants, :updated_at
  end
end