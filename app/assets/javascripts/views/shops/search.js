ShopUp.Views.Search = Backbone.View.extend({

  template: JST['shops/search'],

  initialize: function (options) {
    this.query = options.query
    this.searchResults = new ShopUp.Collections.SearchResults();
    this.searchResults.pageNum = 1;
    this.listenTo(this.searchResults, 'sync', this.render);
    this.searchShops();
  },

  events: {
  },

  render: function () {
    var content = this.template({
      results: this.searchResults
    });
    this.$el.html(content);

    return this;
  },

  searchShops: function() {
    that = this;
    this.searchResults.fetch({
      data: {
        query: that.query
      },
      success: function () {
      },
      error: function (data) {
        console.log(data)
      }
    });
  }

})
