ShopUp.Collections.Shops = Backbone.Collection.extend({
  url: '/api/shops',

  model: ShopUp.Models.Shop,

  getOrFetch: function (id) {
    var model = this.get(id);
    var collec = this;
    if (model) {
      model.fetch();
    } else {
      model = new ShopUp.Models.Shop({ id: id});
      model.fetch({
        success: function () {
          collec.add(model);
        }
      });
    }
    return model;
  }
});

ShopUp.Collections.shops = new ShopUp.Collections.Shops()
