class Category < ActiveRecord::Base
  has_many :users, through: :recipes
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories

  #the gsub replaces spaces with hyphens, downcase makes it lowercase.
  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.find do |instance|
      instance.slug == slug
    end
  end
end
