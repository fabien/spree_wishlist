class WishedProduct < ActiveRecord::Base
  belongs_to :variant
  belongs_to :wishlist
  
  default_scope :order => "wished_products.created_at DESC"
  
  # A wished product is notifiable if there have been changes to the variant 
  # after it was added to the wishlist
  
  scope :ordered, :order => "wished_products.wishlist_id, wished_products.created_at DESC"
  scope :tracked, where(:notify => true)
  scope :notifiable, where('wished_products.notify = ? AND variants.updated_at >= wished_products.created_at', true).includes(:variant, :wishlist)
  
  def notifiable?
    self.notify? && variant.updated_at >= self.created_at
  end
  
end
