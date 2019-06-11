class Category < ActiveRecord::Base
  has_many :users, through: :recipes
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
end
