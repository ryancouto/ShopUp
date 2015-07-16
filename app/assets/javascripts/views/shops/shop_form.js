ShopUp.Views.ShopForm = Backbone.View.extend({

  template: JST['shops/form'],

  initialize: function () {
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

  submit: function () {
    
  }

})
