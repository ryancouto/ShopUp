ShopUp.Models.Shop = Backbone.Model.extend({
  urlRoot: '/api/shops',

  reservations: function () {
    if (!this._reservations) {
      this._reservations = new ShopUp.Collections.Reservations([], { shop: this });
    }
    return this._reservations
  },

  parse: function (response) {
    if (response.reservations) {
      this.reservations().set(response.reservations, { parse: true });
      delete response.reservations;
    }
    return response
  }
})
