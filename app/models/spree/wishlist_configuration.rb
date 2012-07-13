module Spree
  class WishlistConfiguration < Preferences::Configuration
    preference :allow_multiple_lists, :boolean, :default => true
    preference :allow_public_lists,   :boolean, :default => true
    preference :allow_notifications,  :boolean, :default => true
  end
end