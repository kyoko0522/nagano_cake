class Public::ItemsController < ApplicationController
    
def index
    @items = Item.page(params[:page]).reverse_order
end
    
    
    
end
