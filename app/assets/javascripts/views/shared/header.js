ShopUp.Views.Header = Backbone.View.extend({

  initialize: function(options){
    this.listenTo(ShopUp.currentUser, "signIn signOut", this.render);
    this.render();
  },

  events: {
    "click #sign-out-link": "signOut"
  },

  template: JST['shared/header'],

  render: function(){
    var html = this.template({ currentUser: ShopUp.currentUser });
    this.$el.html(html);

    return this;
  },

  signOut: function(event){
    event.preventDefault();
    debugger
    ShopUp.currentUser.signOut({
      success: function(){
        Backbone.history.navigate("", { trigger: true });
      }
    });
  }

});
