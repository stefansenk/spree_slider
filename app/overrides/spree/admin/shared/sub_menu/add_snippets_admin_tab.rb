if Spree.version.to_f < 4.0
 Deface::Override.new(
   virtual_path: 'spree/layouts/admin',
   name: 'slider_admin_menu',
   insert_bottom: '#main-sidebar',
   partial: 'spree/admin/shared/slider_sidebar_menu'
 )
else
 Deface::Override.new(
   virtual_path: 'spree/admin/shared/_main_menu',
   name: 'slider_admin_menu',
   insert_bottom: 'nav',
   partial: 'spree/admin/shared/slider_sidebar_menu'
 )
end
