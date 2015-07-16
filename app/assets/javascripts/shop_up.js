window.ShopUp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    new ShopUp.Routers.Router({
      $rootEl: $('.content'),
      shops: ShopUp.Collections.shops,
      reservations: ShopUp.Collections.reservations,
      users: ShopUp.Collections.reservations
    });

    Backbone.history.start();
  }
};
