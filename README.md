Spec-Chess
----------

http://spec-chess.herokuapp.com/

This is Spec-Chess, an open source project to create an online workplace for user to create rspec tests, answer other users' rspec tests, and have rspec run on the server and spit back results. The project can be found [here](https://github.com/stbarrientos/spec_chess)

Install Spec-Chess
==================

Installing Spec Chess is pretty straightforward, all that you need to is on github. To clone Spec-Chess to your machine, run:

`git clone https://github.com/stbarrientos/spec_chess`

Be sure to create the database and run all of the migrations (the app will not work without them). You can seed the database if you want, there are a few records ready for use.

`rake db:create`  
`rake db:migrate`  
`rake db:seed`

Future Features
===============

We are currently creating a way for users to keep track of the people they have worked with in the past (collaborators) and on letting users create privatre projects that only collaborators can view and work with.

Additionally, we are working to sanitize more methods so that that our security is not as crippling to our users.