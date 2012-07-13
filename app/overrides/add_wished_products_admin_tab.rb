Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "wished_products_admin_sub_tab",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs']",
                     :text => "<%= tab(:wished_products, :label => 'wished_product_management') %>",
                     :disabled => false)