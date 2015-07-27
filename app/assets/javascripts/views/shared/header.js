ShopUp.Views.Header = Backbone.View.extend({

  initialize: function(options){
    this.listenTo(ShopUp.currentUser, "signIn signOut", this.render);
  },

  events: {
    "click #sign-out-link": "signOut",
    "click .search-button": 'search',
    "click #new-shop": 'postShop'
  },

  template: JST['shared/header'],

  render: function(){
    var content = this.template({ currentUser: ShopUp.currentUser });
    this.$el.html(content);
    // this.createDatepicker();
    this.autoCompleter();

    return this;
  },

  // createDatepicker: function () {
  //   this.$( "#datepicker" ).datepicker();
  //   this.$( "#datepicker2" ).datepicker();
  // },


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
      "New York",
      "Brooklyn",
      "San Francisco",
      "Oakland",
      "Los Angeles",
      "London",
      "Paris",
      // "Tokyo",
      // "Chicago",
      // "Berlin",
      // "Copenhagen",
      "Amsterdam",
      "Rome"
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  },

  search: function (event) {
    event.preventDefault();
    var query = this.$('.search-text').val();
    that = this;
    Backbone.history.navigate('#/search?query=' + query, { trigger: true });
  },

  postShop: function(event) {
    event.preventDefault();
    if (ShopUp.currentUser.get('fname') == $('.current-user').text().replace(/ /g,'')) {
      Backbone.history.navigate('#/shops/new', { trigger: true} );
    } else {
      alert ('You must be logged in to post a shop')
    }
  }

});
