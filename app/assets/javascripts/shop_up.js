window.ShopUp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    new ShopUp.Routers.Shops({
      $rootEl: $('.content'),
      shops: ShopUp.Collections.shops
    });

    new ShopUp.Routers.Reservations({
      $rootEl: $('#content'),
      reservations: ShopUp.Collections.reservations
    });

    Backbone.history.start();
  }
};
