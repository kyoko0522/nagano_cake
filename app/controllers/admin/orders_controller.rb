class Admin::OrdersController < ApplicationController
    layout 'admin'
     before_action :authenticate_admin!

 def show
     @order = Order.find(params[:id])
     @customer = @order.customer
     @order_details = @order.order_details
     @total = 0
 end

end
