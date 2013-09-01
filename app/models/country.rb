class Country < ActiveRecord::Base
  attr_accessible :name, :description

  validates :name, presence: true, length: { maximum: 200 }
end
