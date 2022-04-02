class Admin::OrderDetailsController < ApplicationController
   layout 'admin'
      before_action :authenticate_admin!

   def update
      @order_details = order_detail.order.all
   end

end
