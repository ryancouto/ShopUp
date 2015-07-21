ShopUp.Models.Reservation = Backbone.Model.extend({

  urlRoot: '/api/reservations',

  toJSON: function() {
    return { reservation: _.clone( this.attributes ) }
  }

})
