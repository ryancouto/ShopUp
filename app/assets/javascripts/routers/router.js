ShopUp.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.users = options.users;
    this.shops = options.shops;
    this.reservations = options.reservations;
  },

  routes: {
    'signup': 'userNew',
    'login': 'sessionNew',
    'users/:id': 'userShow',
    'users/:id/edit': 'userEdit',

    '': 'home',
    'shops': 'shopIndex',
    'shops/new': 'shopNew',
    'shops/:id': 'shopShow',
    'shops/:id/edit': 'shopEdit',

    'res/new': 'resNew',
    'res/:id': 'resShow',
    'res/:id/edit': 'resEdit'
  },

  newUser: function () {
    var user = new ShopUp.Models.Users();
    var newView = new ShopUp.Views.UserForm({
      model: user,
      collection: this.users
    });

    this._swapView(newView)
  },

  newSession: function () {

  },

  userShow: function () {

  },

  userEdit: function () {

  },

  //////////

  shopIndex: function () {
    this.shops.fetch();

    var indexView = new ShopUp.Views.ShopsIndex({
      collection: this.shops
    });

    this._swapView(indexView)
  },

  shopNew: function () {
    var newShop = new ShopUp.Models.Shop();
    var newView = new ShopUp.Views.ShopForm({
      model: newShop,
      collection: this.shops
    });

    this._swapView(newView)
  },

  shopShow: function (id) {
    var showShop = this.shops.getOrFetch(id);
    var showView = new ShopUp.Views.ShopShow({
      model: showShop
    });

    this._swapView(showView);
  },

  shopEdit: function (id) {
    var editShop = this.shops.getOrFetch(id);
    var editView = new ShopUp.Views.ShopForm({
      model: editShop
    });

    this._swapView(editView);
  },

//////////

  resNew: function () {
    var newRes = new ShopUp.Models.Reservation();
    var newView = new ShopUp.Views.ResForm({
      collection: this.reservations,
      model: newRes
    });

    this._swapView(newView);
  },

  resShow: function (id) {
    var showRes = this.reservations.getOrFetch(id);
    var showView = new ShopUp.Views.ResShow({
      model: showRes
    });

    this._swapView(showView);
  },

  resEdit: function (id) {
    var editRes = this.reservations.getOrFetch(id);
    var editView = new ShopUp.Views.ResForm({
      collection: this.reservations,
      model: editRes
    });

    this._swapView(editView);
  },

////////

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

})