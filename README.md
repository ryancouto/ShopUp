# ShopUp

[Heroku link][heroku]

[heroku]: http://shopup4444.herokuapp.com

## Minimum Viable Product
ShopUp is an AirBnB clone built on Rails and backbone. Users can:

- [x] Create accounts
- [x] Create sessions (log in)
- [x] Post shops
- [x] View shop
- [x] Reserve shops
- [ ] Search shops by location and price
- [ ] Review shops

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Shop Creation and Viewing (~1 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users will be able to create shops using
a simple text form in a Rails view.

[Details][phase-one]

### Phase 2: Backbone Shop View and Reservations (~2 days)
I will add API routes to serve blog and post data as JSON, then add Backbone
models and collections that fetch data from those routes. By the end of this
phase, users will be able to view shop show pages within the backbone framework.
Shop show pages will display pending and approved reservations.

[Details][phase-two]

### Phase 3: Reviews and Pictures (~2 days)
I will create Review and Picture models in both rails and backbone. These models
will be displayed on their associated shop's backbone show pages.

[Details][phase-three]

### Phase 4: CSS styling, JQuery Plugins, Google Maps (~1-2 days)
I will begin CSS styling for the shop's show page, as well as the root page. I will
also utilize a Jquery slideshow on the hsop show page to display associated
pictures. Additionally, I will show shop's locations through the google Maps
API on their show page.


[Details][phase-four]

### Phase 5: Searching for Shops, final CSS styling (~2 days)
I'll need to add `search` routes to the shops controllers. This will filter shops
by their price, size, and location. I will also finish the CSS styling.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] Show page maps display nearby shops
- [ ] AJAX nav bar
- [ ]	Wish lists
- [ ]	Hide reservation requests
- [ ] User avatars

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
