class Product < ApplicationRecord
  validates_presence_of :name, :price, :category
end
