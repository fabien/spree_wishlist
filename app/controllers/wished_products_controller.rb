class WishedProductsController < Spree::BaseController
  resource_controller
  # I'm sorry for this hack, but it is simplest way to make adding to wishlist after user logged in,
  # because redirect_to can not make POST requests
  def index
    create
  end

  create.before do
    @wished_product.wishlist = current_user.wishlist
    @wished_product.notify   = Spree::Config[:track_inventory_levels] && @wished_product.variant.count_on_hand == 0
  end

  create.response do |wants|
    wants.html { redirect_to @wished_product.wishlist }
  end

  update.response do |wants|
    wants.html { redirect_to @wished_product.wishlist }
    wants.js {
      flash[:notice] = nil
      render :js => "alert('#{t :updated_successfully}');"
    }
  end
    destroy.response do |wants|
    wants.html { redirect_to @wished_product.wishlist }
  end
end
