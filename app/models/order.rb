class Order < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: 'OrderItem'
  has_many :products, through: :items

  def serialized
    serialization = as_json
    serialization.merge!(products: products.as_json)
  end

  def order_value
    order_value = products.sum(&:price)
    #order_value = products.inject(0) {|sum, n| n.price  + sum}
  end
end
