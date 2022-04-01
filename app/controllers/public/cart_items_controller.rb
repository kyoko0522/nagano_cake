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
    if @cart_item.blank?
    @cart_item  = current_customer.cart_items.build(item_id: params[:item_id])
    end
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
            new_amount = cart_item.amount + @cart_item.amount
            cart_item.update_attribute(:amount, new_amount)
            @cart_item.delete
        end
    end
    @cart_item.amount += params[:amount].to_i
    @cart_item.save
    redirect_to cart_items_path

end

def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(amount: params[:amount].to_i)
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
