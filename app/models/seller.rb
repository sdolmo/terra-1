class Seller < ActiveRecord::Base
  has_many :listings
  accepts_nested_attributes_for :listings
end
