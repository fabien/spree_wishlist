module Spree
  module Admin
    class WishlistSettingsController < Admin::BaseController
      def update
        # workaround for unset checkbox behaviour
        params[:preferences] ||= {}
        params[:preferences][:allow_multiple_lists] = false if params[:preferences][:allow_multiple_lists].blank?
        params[:preferences][:allow_public_lists]   = false if params[:preferences][:allow_public_lists].blank?
        params[:preferences][:allow_notifications]  = false if params[:preferences][:allow_notifications].blank?
    
        SpreeWishlist::Config.set(params[:preferences])

        respond_to do |format|
          format.html {
            redirect_to admin_wishlist_settings_path
          }
        end
      end
    end
  end
end