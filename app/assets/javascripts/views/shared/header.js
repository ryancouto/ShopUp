ShopUp.Views.Header = Backbone.View.extend({

  initialize: function(options){
    this.listenTo(ShopUp.currentUser, "signIn signOut", this.render);
    this.$el.addClass('home')
  },

  events: {
    "click #sign-out-link": "signOut"
  },

  template: JST['shared/header'],

  render: function(){
    this.$el[0].style.backgroundImage = 'url(http://www.essentialhommemag.com/wp-content/uploads/2013/06/Wittmore_popup_10.jpg)'
    var content = this.template({ currentUser: ShopUp.currentUser });
    this.$el.html(content);
    this.createDatepicker();

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
  }

});