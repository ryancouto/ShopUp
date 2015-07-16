ShopUp.Routers.Shops = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = options.shops
  },

  routes: {
    '': 'home',
    'shops': 'index',
    'shops/new': 'new',
    'shops/:id': 'show',
    'shops/:id/edit': 'edit'
  },

  index: function () {
    this.collection.fetch();

    var indexView = new ShopUp.Views.ShopsIndex({
      collection: this.collection
    });

    this._swapView(indexView)
  },

  new: function () {
    var newShop = new ShopUp.Models.Shop();
    var newView = new ShopUp.Views.ShopForm({
      model: newShop,
      collection: this.collection
    });

    this._swapView(newView)
  },

  show: function (id) {
    var showShop = this.collection.getOrFetch(id);
    var showView = new ShopUp.Views.ShopShow({
      model: showShop
    });

    this._swapView(showView);
  },

  edit: function (id) {
    var editShop = this.collection.getOrFetch(id);
    var editView = new ShopUp.Views.ShopForm({
      model: editShop
    });

    this._swapView(editView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
