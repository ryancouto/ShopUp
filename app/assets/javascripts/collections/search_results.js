ShopUp.Collections.SearchResults = Backbone.Collection.extend({

  url: '/api/search',

  parse: function (response) {
    if (response.total_count) {
      this.total_count = response.total_count;
    }

    return response
  }

})
