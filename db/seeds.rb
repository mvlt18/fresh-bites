Recipe.delete_all
Category.delete_all
User.delete_all


snack = Category.create(:name=>'Snack')
healthy = Category.create(:name=>'Healthy')
breakfast = Category.create(:name=>'Breakfast')
dinner = Category.create(:name=>'Dinner')
meal = Category.create(:name=>'Meal')
