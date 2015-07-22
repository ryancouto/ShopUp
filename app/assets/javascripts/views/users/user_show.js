ShopUp.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  events: {

  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.shops = this.model.shops();
    this.reviews = new ShopUp.Collections.Reviews()
    that = this;
    this.shops.forEach( function(shop) {
      shop.reviews().forEach( function (review) {
        that.reviews.push(review);
      });
    });
  },

  render: function () {

    var content = this.template({
      user: this.model,
      shops: this.shops,
      reviews: this.reviews
    });
    this.$el.html(content);

    return this;
  }

})
