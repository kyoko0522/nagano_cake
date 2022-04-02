class Public::CartItemsController < ApplicationController
 before_action :authenticate_customer!

def index
    @cart_items = current_customer.cart_items
    @new_cart_item = CartItem.new
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
    cart_item = CartItem.new(cart_item_params)
    before_cart_item = current_customer.cart_items.find_by(item_id: cart_item.item_id)
    if   before_cart_item.nil?
         cart_item.customer_id = current_customer.id
         cart_item.save
    else
        new_amount = before_cart_item.amount + cart_item.amount
        before_cart_item.update_attribute(:amount, new_amount)
    end
    redirect_to cart_items_path

end

def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(amount: params[:cart_item][:amount].to_i)
    redirect_to cart_items_path

end

private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
end

def setup_cart_item!
    @cart_item = current_cart_items.find_by(item_id: params[:item_id])
end
end
