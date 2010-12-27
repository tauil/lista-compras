class Product < ActiveRecord::Base
  belongs_to :list
  
  validates_presence_of :name, :amount
  validates_associated :list
end
