class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

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
