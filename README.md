# bobby

![logo](/app/assets/images/master_fav_icon.png)

*The missing buddy for your favourite games*

Visit bobby at **[https://www.bobby-app.ga/](https://www.bobby-app.ga/)**

## The App

Can't make up the numbers for your game? Are flaky friends bailing on you at the last minute, leaving you and others stranded with your game arrangements and out-of-pocket? Or do you just want a way to meet like-minded people who enjoy the same things in life?

Introducing bobby, the missing buddy for your favourite games. bobby is stylish, easy-going, eligible, and 100% committed to you (being able to enjoy your favourite games). Everyone could use a bobby in their life. 

## Problem Statement

Team games and sports require a minimum or a specific number of participants. Individuals have difficulties finding sufficient participants for a game because they are often limited to searching only within their own immediate social circles.

### How It Works

bobby is an online platform that allows individuals to join and/or host a game. 

## Installation Instructions

Requirements/Specs:
- Rails 6.0.3.1
- Ruby 2.7.1
- PostgreSQL 12.1
- Redis 6.0.3
```
Install Redis (MacOS: brew install redis, Ubuntu: apt install redis-server)

bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
redis-server
```

## Application Development Process
### Built With
- **[Ruby 2.7.1](https://www.ruby-lang.org/en/)** - Main Language
- **[Rails 6.0.3.1](https://rubyonrails.org)** <br />- Backend Framework
		<br />-> Action Cable - Websockets / IO activity
		<br />-> Active Storage
		<br />-> [Notifications Engine](https://github.com/rails-engine/notifications) - Notifications framework, mountable as an engine
		<br />-> TurboLinks - JavaScript snippet using AJAX to emulate SPAs, installed by default in Rails
		<br />-> [Glide.js](https://glidejs.com/) - ES6 dependency-free carousel/slider
		<br />-> [Pry](https://github.com/pry/pry) - IRB alternative with additional capabilities
		<br />-> [Gravtastic](https://github.com/chrislloyd/gravtastic) - Framework for integrating user gravatars
		<br />-> [Will-Paginate](https://rubygems.org/gems/will_paginate/versions/3.1.6) - API for rendering pagination links

- **[PostgreSQL 12.1](https://www.postgresql.org/)** - SQL Database
- **[Redis 6.0.3](https://redis.io/)** - Non-relational in-memory Database (used for Action Cable Pub/Sub)
- **[TailwindCSS](https://tailwindcss.com/)** - Utility CSS Framework
- **[Cloudflare](https://cloudflare.com/)** - SSL Provider


### Approach
- Brainstorming using Padlet
- Identified problem statements
- User Stories
- Created User Flows and Wireframes
- ERD
- Page Mock-Ups
- Build features iteratively

### Major Hurdles in building the app.
- Different development operating systems adds complexity when trying to integrate dependencies
- Turbolinks listeners sometimes unintuitive, presented difficulties especially when integrated with external Javascript libraries
- Using webpacker
  
## Documentation

- **[Mockups](/source/)**
- **[ERD](https://github.com/sei22-project/bobby/blob/master/app/source/bobby-app-erd.png)**

## Team

- [Kenan](https://github.com/dev-seahouse)
- [Bobby](https://github.com/bobbykwong)
- [Zach](https://github.com/zachariahchow)