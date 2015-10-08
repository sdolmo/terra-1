class Seller < ActiveRecord::Base
  has_many :listings
  # has_many :locations, through: :listings
  accepts_nested_attributes_for :listings
  # accepts_nested_attributes_for :locations
end
