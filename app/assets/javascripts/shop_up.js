window.ShopUp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.currentUser = new ShopUp.Models.CurrentUser();
    this.currentUser.fetch();
    this.home = new ShopUp.Views.Home();
    this.header = new ShopUp.Views.Header({
      el: $('#header')
    });
    this.header.render();
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
