ShopUp.Views.ShopShow = Backbone.View.extend({

  template: JST['shops/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click .request-button': 'submitRequest'
  },

  render: function () {
    var content = this.template({
      shop: this.model
    });

    this.$el.html(content);
    return this;
  },

  submitRequest: function () {

  }

})
