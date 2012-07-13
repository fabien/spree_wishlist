class Spree::WishedProduct < ActiveRecord::Base
  belongs_to :variant
  belongs_to :wishlist

  attr_accessible :wishlist_id, :variant, :variant_id, :notify
  
  default_scope :order => "spree_wished_products.created_at DESC"
  
  # A wished product is notifiable if there have been changes to the variant 
  # after it was added to the wishlist

  scope :ordered, :order => "spree_wished_products.wishlist_id, spree_wished_products.created_at DESC"
  scope :tracked, where(:notify => true)
  scope :notifiable, where('spree_wished_products.notify = ? AND spree_variants.updated_at >= spree_wished_products.created_at', true).includes(:variant, :wishlist)

  def notifiable?
    self.notify? && variant.updated_at >= self.created_at
  end

end
