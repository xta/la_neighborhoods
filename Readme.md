# LA Neighborhoods

### Setup
    # setup dependencies
    bundle

    # generate data/neighborhoods.txt url list
    ruby lib/build_neighborhoods.rb

    # setup db
    rake db:create db:schema:load

    # load Neighborhood
    rake neighborhoods:create

    # load Profile
    rake profiles:create
    rake profiles:name_heading

### Usage

    # start server
    rails s
    open http://localhost:3000/

### Attribution

The wonderful [LA Times Neighborhoods](http://maps.latimes.com/neighborhoods/) resource
