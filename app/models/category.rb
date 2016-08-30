class Category < ActiveRecord::Base
  has_many :users, :through => :recipes
  has_and_belongs_to_many :recipes
end
