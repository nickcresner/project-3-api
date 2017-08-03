![ga_cog_large_red_rgb](https://cloud.githubusercontent.com/assets/40461/8183776/469f976e-1432-11e5-8199-6ac91363302b.png)

# Alex Cwiek and Nick Cresner's Readme for Adventurefy! Travel App.

### Final project made with Ruby on Rails API with Angular front end.


##How to install

The app is stored on two separate repositories. For the front end:

- Download or clone the repo from: 
( [GitHub link] (https://github.com/nickcresner/project-3-frontend) )
- `yarn install` or `npm i` to install dependencies.
- `bower` to update packages.
- `gulp` to compile the source code and open in browser

For the API:

- Download or clone the repo from: ( [GitHub Link] (https://github.com/nickcresner/project-3-api) )
- `gem install` to install all Ruby gems.
- `rails s` to compile the API and serve the data. 

Or the app is available on Heroku at: ([Adventurefy!] (https://adventurefy.herokuapp.com/))

## Description

Do you ever get that sinking feeling when you have meticulously planned your next adventure, you've decided the country, you know exactly which destinations in that country you are going to visit, but you just can't find the perfect companion to go on your adventure with? Well stick out like a sore thumb no longer, Adventurefy to the rescue! Connect with our beautiful group of users to find your ideal travel partners.

- Make and share awesome travel plans to any country in the world.

- Check out other user's travel plans and get inspired, maybe even choose to join them on their adventure.

- Get a plethora of useful information about your big adventure thanks to our magical APIs.

- Visit other user's profiles to find out more about them and their contact details.

## How to use Adventurefy!

- Log-in or register. Choose to Log-in with your Facebook account with out oAuth authentication option.

- Check out all the available adventures on the 'All the trips' page. You can filter by the name of the country using the search bar at the top of the page.

- Click on an adventure to view more details including incredible information such as average daily budgets for a variety of wallets. Also find weather information and useful facts about the destination country. 

- Add your trip to the Adventurefy! collection to invite other users to join you. Click on the 'Create a trip' link in the nav-bar. Remember to include all your stops at different destinations in the 'Mi Legs' section. Start typing the name of your destination and the Google Maps API will suggest places that you may be looking for, when you see your destination click to autocomplete. Huzzah! 

- Don't forget to include a beautiful image of your destination using our image upload form to make all the other users jealous and desperate to go with on your adventure. 


- Mazel Tov! You have discovered a way to add your trip and Adventurefy! will create a new page for your trip, make magical maps with poly-lines and augment the view with tons of useful API data. 

##Technologies Used

- HTML 5
- SCSS
- JavaScript ES6
- AngularJS
- Git & GitHub
- Gulp
- Yarn
- Bower
- JSON
- Ruby on Rails 5
- Google Maps API
- Facebook oAuth
- PostgreSQL
- BCrypt
- JWT Web Token
- AWS Image Upload
- Dark Sky Weather API
- budgetyourtrip.com API
- REST Countries API

##Challenges Faced

There were a few things that we wished to include but either struggled with the implementation of or ran out of time. One of these was the currency conversion which turned out to be a lot more complicated that we originally had anticipated.

Pulling the external API data in from the back end and then using that to display the information on the front end was a big challenge and a very different process to how we had done it before. We were delighted to be able to make our API's work as they did as it add's a lot of value to the Trips 'Show' page.

Here you can see that we managed to make an API call based on the lat and long of the first leg the user inputs for their trip: 

```
class BudgetYourTripController < ApplicationController

  skip_before_action :authenticate_user!

  def budget
#obtain the country code from the API endpoint, based on lat and lng of the first leg of the journey
    country_data = HTTParty.get("http://www.budgetyourtrip.com/api/v3/search/geo/#{params[:lat]}/#{params[:lng]}",
      {
      headers: { "X-API-KEY": ENV['BUDGET_YOUR_TRIP_KEY'], "Accept" => "application/json"}
    }).parsed_response
#getting the country code from an API
    country_code = country_data["data"][0]["country_code"]

#obtain the daily budget details from the API endpoint, using the country code from the previous call
    daily_budget = HTTParty.get("http://www.budgetyourtrip.com/api/v3/costs/country/#{country_code}",
      {
        headers: { "X-API-KEY": ENV['BUDGET_YOUR_TRIP_KEY'], "Accept" => "application/json"}
      }).parsed_response
#pull the currency code from the data returned from the API
    daily_budget["data"].last["currency_code"] = currency_code

    render json: daily_budget["data"].last, status: :ok
  end
end    
    
```

Also, creating new trip and legs of the trip at the same point, was quite troublesome, as legs belong to a trip, and must have a trip ID. We managed to create a 'temporary' array to store them, that is pushed into the trip's legs upon saving the trip.

```
//creating a temporary array for legs
  vm.legs = [];

  vm.create = tripsCreate;

  function tripsCreate(){
    vm.trip.attendee_ids = [$auth.getPayload().id];
    
    //form validation that is nor allowing to post a trip with less than 2 legs of the journey
    
    if(vm.newTripForm.$valid && vm.legs.length >= 2){
      Trip
      //saving the trip, which gives an ID to id
      .save(vm.trip)
      .$promise
      .then((trip) => {
      
      //looping through the temporary array of legs
      
        vm.legs.forEach((leg) => {
        
        //each leg gets the trip ID
        
          leg.trip_id = trip.id;
          Leg.
          save(leg)
          .$promise
          .then(() => {
            $state.go('tripsIndex');
          });
        });
      });
    }
  }

//pushing the legs to a temporary array

  function addLeg(){
    vm.legs.push(vm.newLeg);
    vm.newLeg = {};
  }
  vm.addLeg = addLeg;

```
    
    

##Improvements and Wishlist

- Currency Converter
- Filter by budget
- Trip randomiser
- Trips covering multiple countries.
- Greater user interactivity such as chat/internal messages.

