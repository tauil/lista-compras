class List < ActiveRecord::Base
  has_many :products # added on my own
  
  validates_presence_of :name

end
