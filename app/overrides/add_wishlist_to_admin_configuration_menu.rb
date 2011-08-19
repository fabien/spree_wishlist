Deface::Override.new(
  :virtual_path => "admin/configurations/index",
  :name => "wishlist_admin_configurations_menu",
  :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
  :text => "<%= configurations_menu_item(t('wishlist_settings.title'), admin_wishlist_settings_path, t('wishlist_settings.description')) %>",
  :disabled => false)
