class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :categories
end
