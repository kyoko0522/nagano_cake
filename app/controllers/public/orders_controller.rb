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
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @order.save
   redirect_to orders_complete_path
end

def confirm
    @current_customer_cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address

    # @order.name = current_customer.first_name + current_customer.last_name
    @total = 0
end

def complete
end


private
def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
end


end
