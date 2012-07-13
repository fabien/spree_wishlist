module Spree
  module Admin
    class WishedProductsController < Admin::ResourceController
  
      protected

      def collection
        @wished_products = if params[:filter] == 'off'
          WishedProduct.unscoped.tracked.ordered.page(params[:page]).per(10)
        else
          WishedProduct.unscoped.notifiable.ordered.page(params[:page]).per(10)
        end
      end
  
    end
  end
end