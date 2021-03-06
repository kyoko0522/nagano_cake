class Admin::CustomersController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

def index
    @customers = Customer.all
end

def show
    @customer = Customer.find(params[:id])
end

def edit
    @customer = Customer.find(params[:id])
end

def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
end

private

def customer_params
    params.require(:customer).permit(:customer_id, :first_name, :last_name,:first_name_kana, :last_name_kana, :postal_code, :adress, :email, :is_deleted, :telephone_number)
end


end
