ShopUp.Views.ShopsIndex = Backbone.View.extend({

  template: JST['shops/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  events: {

  },

  render: function () {
    var content = this.template({
      shops: this.collection
    });

    this.$el.html(content);
    return this;
  }

})
