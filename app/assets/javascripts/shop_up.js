window.ShopUp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.currentUser = new ShopUp.Models.CurrentUser();
    this.currentUser.fetch();
    this.home = new ShopUp.Views.Home();
    this.thinHeader = new ShopUp.Views.ThinHeader({
      el: $('#thin-header')
    });
    this.router = new ShopUp.Routers.Router({
      $rootEl: $('.content'),
      shops: ShopUp.Collections.shops,
      reservations: ShopUp.Collections.reservations,
      users: ShopUp.Collections.users,
      reviews: ShopUp.Collections.reviews
    });

    Backbone.history.start();
  }
};
