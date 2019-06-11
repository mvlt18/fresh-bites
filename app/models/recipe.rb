class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
end
