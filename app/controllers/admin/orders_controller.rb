class Admin::OrdersController < ApplicationController
    layout 'admin'
     before_action :authenticate_admin!

 def show
     @order = Order.find(params[:id])
     @order_details = order_detail.order
 end

end
