class User < ActiveRecord::Base
  has_many :recipes
  has_many :categories, through: :recipes

  validates :email, uniqueness: true

  has_secure_password

  #the gsub replaces spaces with hyphens, downcase makes it lowercase.
  def slug
    self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.find do |instance|
      instance.slug == slug
    end
  end
end
