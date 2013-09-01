class Brand < ActiveRecord::Base
  attr_accessible :category_id, :name, :description
  has_many :products, dependent: :destroy
end
