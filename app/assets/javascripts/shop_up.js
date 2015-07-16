window.ShopUp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.currentUser = new ShopUp.Models.CurrentUser();
    this.currentUser.fetch();

    new ShopUp.Routers.Router({
      $rootEl: $('.content'),
      shops: ShopUp.Collections.shops,
      reservations: ShopUp.Collections.reservations,
      users: ShopUp.Collections.reservations
    });

    Backbone.history.start();
  }
};
