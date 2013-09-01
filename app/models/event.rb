class Event < ActiveRecord::Base
  attr_accessible :name, :description, :picture, :start_at, :end_at

  # relations
  has_one :picture, class_name: :attachment, as: :attachmentable, dependendent: :destroy
end
