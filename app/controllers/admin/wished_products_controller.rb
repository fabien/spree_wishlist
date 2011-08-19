class Admin::WishedProductsController < Admin::ResourceController
  
  protected

  def collection
    @wished_products = if params[:filter] == 'off'
      WishedProduct.unscoped.tracked.ordered.page(params[:page]).per(Spree::Config[:per_page])
    else
      WishedProduct.unscoped.ordered.notifiable.page(params[:page]).per(Spree::Config[:per_page])
    end
  end
  
end