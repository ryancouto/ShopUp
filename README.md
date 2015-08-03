# ShopUp

[Live]: http://shopup.xyz

## About
ShopUp is an Airbnb inspired app for commercial pop-up store rentals. I chose to
use a single-page design, along with asynchronous server requests, to create the
most fluid user experience possible.

## How To Use

### Log In
I suggest using the 'Sign In as Guest' feature to fully experience the site's
functionality.

### Home Page
The Home Page features 7 cities, which are all populated with shops for rent.
If you click on a picture, you will be taken to the search page, featuring all
shops for rent in that city.

### User Page
Click on your Username in the top right of the header, and you will be taken to
your profile page. From here, you can see all of the shops you own, the reservations
for those shops that you've approved, the reservations that are still pending, and
reservations that you have requested for other shops. These are all clickable links
that will take you to the page of the associated shop.

### Shop Page
Your shops page is where you can approve and delete requests for reservations.
If it is a shop that you do not own, you can request a reservation, delete any
requests you've made, or write a review about the shop. Additionally, you can read
reviews posted by other users.

### Search Page
From any page on the site, you can conduct a new search through the header. Begin
typing in the 'Where do you want to pop up?' text box, and you will be given search
suggestions in an autocomplete dropdown. Optionally, you may choose a search radius
to look for shops in nearby cities as well (San Francisco and Oakland,
New York and Brooklyn). The search page will show all shops that match your input,
displayed in order of proximity. Each shop shows it's size, price, address, and
description.

### Shop Post
Through the 'Post a Shop' link on the header, you can create a new shop. On this
form, you can specify your shop's address, city, description, price, and size.
Additionally, you can upload a picture to accompany your shop's page through Paperclip
and AWS.

## Technologies Used

### Languages
* JavaScript
* Ruby
* HTML
* CSS

### Frameworks
* Ruby on Rails
* Backbone.js

### Miscellaneous
* jQuery
* jQuery-UI
* AJAX
* Paperclip/AWS
* Geocoder
* Figaro
* jBuilder
* OmniAuth

### To-Do
* Nearby Shops
* Google Map API Integration
* Infinite Scrolling
* Wish lists
* User avatars

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
