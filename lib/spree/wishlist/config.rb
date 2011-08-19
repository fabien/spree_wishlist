module Spree::Wishlist
  class Config < Spree::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        WishlistConfiguration.find_or_create_by_name("Wishlist configuration")
      end
    end
  end
end
