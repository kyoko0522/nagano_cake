class Order < ApplicationRecord
    
enum payment_method: { credit_card: 0, transfer: 1 }
belongs_to :customer
has_many :order_details, dependent: :destroy
def subtotal
    item.order.with_tax_price * amount
end  
end
