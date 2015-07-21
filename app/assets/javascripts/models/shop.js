ShopUp.Models.Shop = Backbone.Model.extend({
  urlRoot: '/api/shops',

  toJSON: function() {
    return { shop: _.clone( this.attributes ) }
  },

  reservations: function () {
    if (!this._reservations) {
      this._reservations = new ShopUp.Collections.Reservations([], { shop: this });
    }
    return this._reservations;
  },

  reviews: function () {
    if (!this._reviews) {
      this._reviews = new ShopUp.Collections.Reviews([], { shop: this });
    }
    return this._reviews;
  },

  parse: function (response) {
    if (response.reservations) {
      this.reservations().set(response.reservations, { parse: true });
      delete response.reservations;
    }
    if (response.reviews) {
      this.reviews().set(response.reviews, { parse: true });
      delete response.reviews;
    }
    return response
  }
})
