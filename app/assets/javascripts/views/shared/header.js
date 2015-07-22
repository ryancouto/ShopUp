ShopUp.Views.Header = Backbone.View.extend({

  initialize: function(options){
    this.listenTo(ShopUp.currentUser, "signIn signOut", this.render);
    this.searchResults = new ShopUp.Collections.SearchResults();
    this.listenTo(this.searchResults, 'sync', this.render);
    this.searchResults = new ShopUp.Collections.SearchResults();
    this.listenTo(this.searchResults, 'sync', this.search);

  },

  events: {
    "click #sign-out-link": "signOut",
    "click .search-button": 'search'
  },

  template: JST['shared/header'],

  render: function(){
    var content = this.template({ currentUser: ShopUp.currentUser });
    this.$el.html(content);
    this.createDatepicker();
    this.autoCompleter();

    return this;
  },

  createDatepicker: function () {
    this.$( "#datepicker" ).datepicker();
    this.$( "#datepicker2" ).datepicker();
  },


  signOut: function(event){
    event.preventDefault();
    ShopUp.currentUser.signOut({
      success: function(){
        Backbone.history.navigate("", { trigger: true });
      }
    });
  },

  autoCompleter: function() {
    var availableTags = [
      "New York City",
      "San Francisco",
      "Brooklyn",
      "Oakland",
      "Los Angeles",
      "London",
      "Paris",
      "Tokyo",
      "Chicago",
      "Berlin",
      "Copenhagen",
      "Amsterdam",
      "Philadelphia",
      "Miami",
      "Boston",
      "Montreal"
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  },

  search: function (event) {
    event.preventDefault();
    
    Backbone.history.navigate('#/search', { trigger: true });
  }

});
