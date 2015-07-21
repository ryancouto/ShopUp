ShopUp.Models.Review = Backbone.Model.extend({

  urlRoot: '/api/reviews',

  toJSON: function() {
    return { review: _.clone( this.attributes ) }
  }

})
