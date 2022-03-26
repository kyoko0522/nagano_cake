class Public::CustomersController < ApplicationController

def show
    @customer = Customer.find(params[:id])
    @address = @customer.address
    @order = @customer.order
end

def edit
  @customer = Customer.find(params[:id])
end

def update
  customer = Customer.find(paramas[:id])
  customer.update
  redirect_to customer_path(customer)
end

def exit
  @customer = Customer.find(params[:id])
end

def withdraw
  @customer = Customer.find(params[:id])
  @customer.update(is_deleted: false)
  reset_session
  redirect_to root_path
end

 private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kamna, :postal_code, :telephone_number, :address, :email)
  end
    
end
