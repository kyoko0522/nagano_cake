class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!
def index
    @orders = order.customer
end
    
def new
    @customer = current_customer
    @order = Order.new
    @total = 0
end

def show
    @order = Order.find(params[:id])
    @order_details = @order.customer
end


def create
   @order = current_customer.order
   @order.save
   redirect_to orders_comfirm_path
end
    
def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
end

def complete
end



def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
end

    
end
