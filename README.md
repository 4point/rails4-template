# Rails4 Template

pct's rails4 template, modified from ihower's and other resources.

## NOTICE
This repo could not be used NOW, because too many gems did not support rails4 yet.

## WARNING
This template `DISABLE` turbolinks by default. If you want to add it back, please check the following lines on your code:

1. app/assets/javascripts/application.js

		//= require turbolinks
	
2.  app/views/layouts/application.html.erb

		<%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
  		<%= javascript_include_tag "application", "data-turbolinks-track" => true %>
		

## Usage:

#### Template for frontend only:
    $ rails new YourAppName -m https://raw.github.com/pct/rails4-template/master/frontend.rb

#### Template for backend only:
    $ rails new YourAppName -m https://raw.github.com/pct/rails4-template/master/backend.rb
    
and the scaffold command::

    $ rails g scaffold post title:string content:text
    $ rake db:migrate

## Backend Screenshots

(rails new MyBlog -m https://raw.github.com/pct/rails4-template/master/full.rb)

#### frontend: /
![frontend](https://raw.github.com/pct/rails4-template/master/screenshots/frontend.png)

#### login page: /admins/sign_in 
![login](https://raw.github.com/pct/rails4-template/master/screenshots/login.png)

#### backend page: /backend
![backend](https://raw.github.com/pct/rails4-template/master/screenshots/login_success.png)

#### scaffold list: /backend/posts
![list](https://raw.github.com/pct/rails4-template/master/screenshots/list.png)

#### search results:
![search result](https://raw.github.com/pct/rails4-template/master/screenshots/filter.png)

#### scaffold view: /backend/posts/1
![view](https://raw.github.com/pct/rails4-template/master/screenshots/view.png)


## TODO:

1. admin add cancan
2. admin add CRUD log
3. admin change email and password

## Reference

1. https://github.com/gabetax/twitter-bootstrap-kaminari-views
2. https://github.com/ihower/rails4-app-template
3. http://twitter.github.com/bootstrap/
4. https://github.com/plataformatec/devise
5. https://github.com/ernie/ransack
6. http://net.tutsplus.com/tutorials/ruby/digging-into-rails-4/
7. http://edgeguides.rubyonrails.org/4_0_release_notes.html
