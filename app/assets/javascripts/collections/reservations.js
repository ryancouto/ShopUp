ShopUp.Collections.Reservations = Backbone.Collection.extend({
  url: '/api/reservations',

  model: ShopUp.Models.Reservation,

  getOrFetch: function (id) {
    var model = this.get(id);
    var collec = this;
    if (model) {
      model.fetch();
    } else {
      model = new ShopUp.Models.Reservation({ id: id});
      model.fetch({
        success: function () {
          collec.add(model);
        }
      });
    }
    return model;
  }
});

ShopUp.Collections.reservations = new ShopUp.Collections.Reservations()
