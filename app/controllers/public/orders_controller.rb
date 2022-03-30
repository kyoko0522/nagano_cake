class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!
def index
    @orders = current_customer.orders
end

def new
    @customer = current_customer
    @order = Order.new
    @total = 0
end

def show
    @order = Order.find(params[:id])
    @order_details = @customer.order
end


def create
   @cart_items = current_customer.cart_items.all
   @order = current_customer.orders.new(order_params)
   @order.customer_id = current_customer.id
   if @order.save

   cart_items.each do |cart|
       order_detail = OrderDetail.new
       order_detail.item_id = cart_item.id
       order_detail.order_id = @order.id
       order_detail.amount = cart_item.amount
       order_detail.save
   end
   redirect_to orders_complete_path
   cart_item.destroy_all
   else
    @order = Order.new(order_params)
    render :new
   end
end

def confirm

    @order = Order.new(order_params)
    # @order.name = current_customer.first_name + current_customer.last_name
    @total = 0
	@current_customer_cart_items = current_customer.cart_items
	@order.payment_method = params[:order][:payment_method]

	if params[:order][:address_number] == "0"
	   @order.name = current_customer.name
	   @order.postal_code = current_customer.postal_code
	   @order.address = current_customer.address
	elsif params[:order][:addres_number] == "1"
		@sta = params[:order][:order_address].to_i
		binding.pry
		@order_address = Address.find(@sta)
		@order.postal_code = @order_address.postal_code
		@order.address = @order_address.address
		@order.name = @order_address.dear_name

	elsif params[:order][:address_number] == "2"
		@order.postal_code = params[:order][:postal_code]
		@order.address = params[:order][:order_address]
	end

end

def complete
end


private
def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
end


end
