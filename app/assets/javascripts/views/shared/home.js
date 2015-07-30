ShopUp.Views.Home = Backbone.View.extend({

  initialize: function(options){

  },

  events: {

  },

  template: JST['shared/home'],

  render: function(){

    var content = this.template({ currentUser: ShopUp.currentUser });
    this.$el.html(content);
    // this.createDatepicker();

    return this;
  }

});
