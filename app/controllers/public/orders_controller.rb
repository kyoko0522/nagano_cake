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

   cart_items.each do |cart_item|
       order_detail = OrderDetail.new
       order_detail.item_id = cart_item.id
       order_detail.order_id = @order.id
       order_detail.amount = cart_item.amount
       order_detail.order.item.price = cart_item.price
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
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    # @order.name = current_customer.first_name + current_customer.last_name
    @total = 0
	  @order.payment_method = params[:order][:payment_method]

	  if params[:order][:address_number] == "0"
	   @order.postal_code = current_customer.postal_code
	   @order.address = current_customer.address
  	elsif params[:order][:addres_number] == "1"
		if Address.exists?(name: params[:order][:registered])
		@order.postal_code = Address.find(params[:order][:registered]).postal_code
		@order.address = Address.find(params[:order][:registered]).address
		@order.name = Address.find(params[:order][:registered]).name
		else
		  render :new
		end

	  elsif params[:order][:address_number] == "2"
	    address_new = current_customer.address.new(address_params)
		if address_new.save
		else
		  render :new
  	end
  	else
  	  redirect_to orders_complete_path
        end
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
   end


def complete
end


private
def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_price)
end

def address_params
  params.require(:order).permit(:name, :address, :postal_code)
end

end
