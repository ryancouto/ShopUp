ShopUp.Views.ThinHeader = Backbone.View.extend({

  initialize: function(options){
    this.listenTo(ShopUp.currentUser, "signIn signOut", this.render);
  },

  events: {
    "click #sign-out-link": "signOut",
    "click #datepicker": "createDatepicker"
  },

  template: JST['shared/thin_header'],

  render: function(){
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
