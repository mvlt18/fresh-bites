# Sinatra Project: Fresh Bites

For the final assessment in the Sinatra section of the [Learn.co](https://flatironschool.com/career-courses/coding-bootcamp/online) Software Engineering curriculum— the task was to create a CRUD, MVC app using Sinatra.

I created a simple demo web application called **Fresh Bites** to practice using all the skills and tools I’ve learned so far. What is Fresh Bites you may ask?

Fresh Bites allows users to create an account to manage recipes for their furry best friends. Basically, I just wanted an excuse to use dog stock photos.

![](https://thepracticaldev.s3.amazonaws.com/i/jos0ic48p87fzby5nxp1.png)

If you are looking to create a simple web app fast — here are the steps I took to get from concept to functional application.

### Step 1 : Model Relationships
There were some benchmark specifications that were required as follows:

* Include more than one model class
* Include at least one has_many relationship on your User model
* Include at least one belongs_to relationship on another model

I found it to helpful to draw out my relationships first — before even opening up my terminal to start building anything.

I knew I wanted a User model and Recipe Model to start with. I decided it would be a nice addition to add a Category Model which meant I needed to add a fourth and final Recipe_category Model as shown below:

![](https://thepracticaldev.s3.amazonaws.com/i/e7pus6far2dudai4zl6v.png)

### Step 2: Corneal Template
I used the [Corneal](https://github.com/thebrianemory/corneal) Ruby gem to lay out my basic app structure. Not only did this save time, it was pretty comprehensive as well! I definitely recommend trying it out!

### Step 3: Database Migrations
With the help of ActiveRecord, I created database migrations for each of my models…I did relaize I forgot to add a user_id column to my recipes table which added one last migration. Luckily, using a few gems (activerecord, sinatra-activerecord, and rake), it is super easy to do all of this. To learn more about how these gems work to set up ActiveRecord to add a database to Sinatra applications — check out [this post](https://learn.co/lessons/sinatra-activerecord-setup) which I found super helpful.

![](https://thepracticaldev.s3.amazonaws.com/i/yhjvijkxb3dv97ccrdih.png)
###### Snapshot of final set of database migrations

### Step 4: Model — View — Controller (MVC)
With the basic template already created with the Corneal gem — I went deeper with the MVC architectural pattern:

![](https://thepracticaldev.s3.amazonaws.com/i/i0frw1vqishpz7akx1r8.png)
###### Snapshot of final MVC file structure

#### Creating my Models
Having already drawn out my model relationships, this was a a pretty simple task. I created my four models (User, Recipe, Category, and Recipe_category) all inheriting from Active Record. If you want to learn more about the details of how to do this — and quite frankly all that comes after — I highly recommend [this guide](https://guides.rubyonrails.org/active_record_basics.html).

It’s awesome, I advise to stop reading this and just go there 😊

#### Creating my Views
User — signup, login, index, and show view pages.
Recipe — index, show, new, and edit view pages.
Categories — only needed an index and show views.

In addition, I created a welcome and a logout view page.

FYI: The layout.erb file holds all of my styling to keep a consistent feel for all my pages. I used the [yield statement](https://learn.co/lessons/sinatra-yield-readme) in the layout.erb file where I wanted other view page content to be loaded.

#### Creating my Controllers
This is where we build out CRUD (Create, Read, Update, Delete) functionality.

I’ve summarized what controller actions I included in my application. I used [this post](https://learn.co/lessons/sinatra-restful-routes-readme) as my guide for how to implement RESTful routes. If you are interested in the code, I’ve added a link to the GitHub repo at the end of this blog!

*application_controller*
* route to my welcome page & a few helper methods

*users_controller*
* index action (display all users) and show action (display a single user)
* get request to display signup page and post request create a new user account
* get request to display login page and post request to log into an existing account
* get request to logout

*recipes_controller*
* index action (display all recipes) and show action (display a single recipe)
* new action to display new recipe form and create action to create a new recipe
* edit action to display an edit recipe form and update action to update the recipe
* delete action to delete a recipe

*categories_controller*
* index action (display all categories) and show action (display a single category)

I listed the above in order of “MVC”, however, I prefer to write out Models, Controllers, then Views… or even more realistically Models, then alternate between Controllers and Views — as you create RESTful routes in the controller, creating corresponding views (erb files) and then testing it out to make sure it works.

There is a lot more that went into programming (*debugging really*) all the functionality and front-end design of the application but these are the steps I took in the beginning to at least get to a point where I have an application that was running!

## Installation

* Install Ruby 2.6.1 on your local computer
* Fork the repository from https://github.com/mvlt18/sinatra-project
* Clone the repository into a directory of your choice with `git clone git@github.com:mvlt18/sinatra-project.git`
* Navigate to the directory with `cd sinatra-project`
* Run `bundle install`
* Create the program tables `rake db:migrate`
* Run `shotgun`
* Open a browser of your choice (we recommend Chrome) and enter the given local url provided by the shotgun server.

## Demo

https://youtu.be/3xVj85PZCNY

## Contributing

You can make a request or report a bug by creating an issue or by submitting a pull request.
* Create a branch named after the feature or bug.
* Write your code and commit changes/issue with a commit message.
* Push the branch to the master branch.
* Create a pull request, explaining the issue/reason for change/feature addition.

## License

Fresh Bites is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
