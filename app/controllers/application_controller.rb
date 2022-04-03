class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
    root_path
  end




  # def current_cart_item
  #   if session[:cart_item_id]
  #     @cart_item = CartItem.find(session[:cart_item_id])
  #   else
  #     @cart_item = CartItem.create
  #     session[:cart_item_id] = @cart_item.id
  #   end
  # end



end
