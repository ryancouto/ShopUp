ShopUp.Collections.Reviews = Backbone.Collection.extend({
  url: '/api/reviews',

  model: ShopUp.Models.Reservation,

  getOrFetch: function (id) {
    var model = this.get(id);
    var collec = this;
    if (model) {
      model.fetch();
    } else {
      model = new ShopUp.Models.Review({ id: id});
      model.fetch({
        success: function () {
          collec.add(model);
        }
      });
    }
    return model;
  }
});

ShopUp.Collections.reviews = new ShopUp.Collections.Reviews()
