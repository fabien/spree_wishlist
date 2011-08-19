Variant.class_eval do
  
  has_many :wished_products, :dependent => :destroy
  has_many :wishlists, :through => :wished_products
  
end