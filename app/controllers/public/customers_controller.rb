class Public::CustomersController < ApplicationController
before_action :authenticate_customer!
def show
    @customer = current_customer

end

def edit
  @customer = Customer.find(params[:id])
end

def update
  customer = Customer.find(params[:id])
  customer.update(customer_params)
  redirect_to customer_path(customer)
end

def exit
  @customer = current_customer
end

def withdraw
  @customer = current_customer
  @customer.update(is_deleted: true)
  reset_session
  redirect_to root_path
end

 private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :telephone_number, :address, :email)
  end

end
