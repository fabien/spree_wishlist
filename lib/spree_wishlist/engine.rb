module SpreeWishlist
  class Engine < Rails::Engine
    engine_name 'spree_wishlist'

    config.autoload_paths += %W(#{config.root}/lib)
    
    initializer "spree.shared_assets.environment", :before => :load_config_initializers do |app|
      SpreeWishlist::Config = Spree::WishlistConfiguration.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      #Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/**/*.rb")) do |c|
      #  Rails.application.config.cache_classes ? require(c) : load(c)
      #end
      Spree::Ability.register_ability(WishlistAbility)
    end

    config.to_prepare &method(:activate).to_proc
  end
end
