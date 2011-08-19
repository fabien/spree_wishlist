Rails.application.routes.draw do
  resources :wishlists
  resources :wished_products
  match '/wishlist' => "wishlists#show", :as => "default_wishlist"
  
  namespace :admin do
    resources :wishlists
    resources :wished_products
    resource  :wishlist_settings
  end  
end
