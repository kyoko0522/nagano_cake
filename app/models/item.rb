class Item < ApplicationRecord
 attachment :image
 has_many :cart_items, dependent: :destroy
 has_many :order_details, dependent: :destroy
 has_many :orders, through: :order_details
def with_tax_price
    (price * 1.1).floor
end
end
