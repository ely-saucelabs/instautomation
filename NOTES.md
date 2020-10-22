# Steps

## Install Ruby:
Reference: https://guides.rubyonrails.org/getting_started.html#installing-ruby

`brew install ruby` 
`ruby -v`
    `ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]`

`brew install rbenv`

## Install Rails
https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails-installing-rails

`gem install rails`
`rbenv rehash`
`rails -v`
    `Rails 6.0.3.4`

## Install Node.js and yarn 
https://guides.rubyonrails.org/getting_started.html#installing-node-js-and-yarn 

`node -v`     
    `v12.19.0`

## Install yarn
`yarn -v`     
    `1.22.10`  

 ## Install SQLite3 
 https://guides.rubyonrails.org/getting_started.html#installing-sqlite3  

`sqlite3 --version`
    `3.28.0`

 ## New rails application

 `rails new instautomation`

 <!-- ## Install Bundler

`gem install bundler` -->

 ## Go to the app 

 `cd instautomation`

 ### Things that maybe be aditionally needed

 ```
 Webpacker requires Node.js >= 8.16.0 and you are using 8.15.0
Please upgrade Node.js https://nodejs.org/en/download/
``` 

Do: 
* `nvm install 12`
* `nvm use 12`

 ## Start the server 

 ```
 rails server
 ```

 * Open: 127.0.0.1:3000

 ### Errors:

 ```
 Webpacker configuration file not found /Users/elizabethflores/dev/instautomation-test/instautomation/config/webpacker.yml. Please run rails webpacker:install Error: No such file or directory @ rb_sysopen - /Users/elizabethflores/dev/instautomation-test/instautomation/config/webpacker.yml (RuntimeError)
 ```

 Run:
 ```
 rails webpacker:install
 ```

```
Yarn not installed. Please download and install Yarn from https://yarnpkg.com/lang/en/docs/install/
```

```
brew install yarn
```

```
yarn install
```

## Run Tests

```
rails test
```

Will see:

```
/Users/elizabethflores/dev/instautomation-test/instautomation/db/schema.rb doesn't exist yet. Run `rails db:migrate` to create it, then try again. If you do not intend to use a database, you should instead alter /Users/elizabethflores/dev/instautomation-test/instautomation/config/application.rb to limit the frameworks that will be loaded.
```

* Run: `rails db:migrate`

* Run tests again: `rails test`

```
Running via Spring preloader in process 73961
Run options: --seed 26301

# Running:

Finished in 0.124719s, 0.0000 runs/s, 0.0000 assertions/s.
0 runs, 0 assertions, 0 failures, 0 errors, 0 skips
```

* Run tests with verbose: `rails test -v`
```
Running via Spring preloader in process 32757
Run options: -v --seed 26094

# Running:

PhotosControllerTest#test_should_get_index = 0.13 s = .

Finished in 0.170620s, 5.8610 runs/s, 5.8610 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

## Deployment to Heroku

> Based on: https://guides.railsgirls.com/heroku 

* Follow https://devcenter.heroku.com/articles/getting-started-with-ruby 

### Heroku Setup 
`brew install heroku/brew/heroku`
`bundle config set without 'production'`

### Create the app in Heroku

`heroku create [APP_NAME]`
`heroku buildpacks:set heroku/ruby`
`git push heroku main`

### Deployment to heroku 

> Need to connect the repository in Heroku. 

* Go to: https://dashboard.heroku.com/apps/instautomation-test-1/deploy/github 
* Click on Connect to GitHub 
* Authorize Heroku App
* Choose the repository you want to deploy 
* Enable Automatic Deployments

## Instructions

### Local Setup
1. Clone repository: `git clone ...`
1. cd `repository`
1. `ruby -v`
1. `rails -v`
2. `rails db:migrate`
3. `rails test`
4. `rails server`
5.  Open: http://127.0.0.1:3000

### Heroku

#### Create new app

1. Go to: https://dashboard.heroku.com/new-app
1. Select an app name 
1. Select a region 


#### Connect to GitHub in Heroku

1. Select the app you created
1. Go to the Deploy Tab and Select GitHub: https://dashboard.heroku.com/apps/powerful-ridge-83474/deploy/github
1. Click on Connect to GitHub 
1. This will redirect you to GitHub where you need to authorize the Heroku App
1. Back in Heroku, enter the GitHub repository name
1. Click on _Search_ 
1. You will see the repository name: `ely-saucelabs/instautomation-test`
1. Click on Connect 
1. Choose the `main` branch

#### Create a deployment pipeline 

1. Select the app you created
1. Go to the Deploy Tab and on the _Add this app to a pipeline_, select _Choose a pipeline_ -> _Create new pipeline_, e.g. instautomation-deployment
1. Choose a stage to add this app to and select _production_ (we won't have a _staging_ / _uat: user acceptance testing_ environment in this case)
1. Click on  _Create pipeline_ 
1. On the pipeline page, we will enable the _Review Apps_ feature. 
1. Click on _Connect to GitHub_
1. In _Search for a repository to connect to_, select the repository name: `instautomation-test`
1. Click on _Search_ 
1. You will see the repository name: `ely-saucelabs/instautomation-test`
1. Click on Connect 
1. In _Review apps_, click on _Enable_
1. Select _Create new review apps for new pull requests automatically_
1. Select _Destroy stale review apps automatically_ (you can leave the default 5 days)
1. Choose a region that is closer to you :) 
1. Click on Enable Review Apps 
