class Public::CartItemsController < ApplicationController
 before_action :authenticate_customer!
def index
    @cart_items = current_customer.cart_items
    @total = 0

end

 def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
 end

 def destroy_all
     current_customer.cart_items.destroy_all
     redirect_to cart_items_path
 end

def create
    @cart_item  = current_customer.cart_items.build(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
end

def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path(cart_item)
end

private
def cart_item_params
    require(:cart_item).permit(:item_id, :amount)
end

end
