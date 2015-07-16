ShopUp.Routers.Reservations = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = options.reservations;
  },

  routes: {
    'res/new': 'new',
    'res/:id': 'show',
    'res/:id/edit': 'edit'
  },

  new: function () {
    var newRes = new ShopUp.Models.Reservation();
    var newView = new ShopUp.Views.ResForm({
      collection: this.collection,
      model: newRes
    });

    this._swapView(newView);
  },

  show: function (id) {
    var showRes = this.collection.getOrFetch(id);
    var showView = new ShopUp.Views.ResShow({
      model: showRes
    });

    this._swapView(showView);
  },

  edit: function (id) {
    var editRes = this.collection.getOrFetch(id);
    var editView = new ShopUp.Views.ResForm({
      collection: this.collection,
      model: editRes
    });

    this._swapView(editView);
  },

  _swapView: function () {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
