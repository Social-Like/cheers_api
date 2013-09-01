class Order < ActiveRecord::Base
  attr_accessible :ordered_at, :quantity, :product_id, :quantity, :address
  attr_accessible :first_name, :last_name, :email, :phone
end
