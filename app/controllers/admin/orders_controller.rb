class Admin::OrdersController < ApplicationController
    layout 'admin'
     before_action :authenticate_admin!

 def show
     @order = Order.find(params[:id])
     @customer.id = @order.customer.id
     @order_details = @order.order_details.all
     @total = 0
 end

end
