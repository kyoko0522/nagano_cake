class Public::OrdersController < ApplicationController
    
def new
    @customer = current_customer
    @addresses = Address.all
    @order = Order.new
end

def create
   @order = current_customer.order
   @order.save
   redirect_to orders_comfirm_path
end
    



    
end
