class Product < ActiveRecord::Base
  attr_accessible :category_id, :brand_id, :country_id, :name, :description, :photo, :picture_attributes

  # relations
  belongs_to :category
  belongs_to :brand
  belongs_to :country
  has_one :picture, class_name: "Attachment", as: :attachmentable, dependent: :destroy
  accepts_nested_attributes_for :picture

  # delegates
  delegate :name, to: :brand, allow_nil: true, prefix: true
  delegate :name, to: :category, allow_nil: true, prefix: true
  delegate :name, to: :country, allow_nil: true, prefix: true
  delegate :list, to: :picture, allow_nil: true, prefix: true

  validates :name, :category_id, presence: true
  validates_associated :picture
end
