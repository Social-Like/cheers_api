class Category < ActiveRecord::Base
  attr_accessible :name, :description, :brands_attributes

  has_many :brands, dependent: :destroy
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :brands, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: { maximum: 200 }

  def brand_names
    brands.map(&:name).join(", ") rescue ""
  end
end
