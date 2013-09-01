class Promotion < ActiveRecord::Base
  attr_accessible :name, :description, :start_at, :end_at, :price

  # relations
  has_one :picture, class_name: :attachment, as: :attachmentable, dependendent: :destroy
end
