class Order < ApplicationRecord

enum payment_method: { credit_card: 0, transfer: 1 }
belongs_to :customer
has_many :order_details, dependent: :destroy
has_many :items, through: :order_details
has_one :current_order_order_detail, -> {where(main_flg: true)}, class_name: 'OrderDetail'
has_one :current_item, through: :current_order_order_detail, source: :order_detail
def subtotal
    item.order.with_tax_price * amount
end
end
