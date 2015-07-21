ShopUp.Views.ShopForm = Backbone.View.extend({

  template: JST['shops/form'],

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click .shop-form-button': 'submit'
  },

  render: function () {
    var content = this.template({
      shop: this.model
    });

    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = $('.shop-form').serializeJSON().shop;
    var view = this;
    this.model.save(attrs, {
      success: function () {
        view.collection.add(view.model, { merge: true });
        Backbone.history.navigate('#/shops/' + view.model.id.toString(), { trigger: true });
      },
      error: function (data) {
        console.log(data);
      }
    });
  }
});
