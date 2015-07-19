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
  },

  // createDatepicker: function () {
  //   this.$( "#datepicker" ).datepicker();
  //   this.$( "#datepicker2" ).datepicker();
  // },
  //
  // signOut: function(event){
  //   event.preventDefault();
  //   ShopUp.currentUser.signOut({
  //     success: function(){
  //       Backbone.history.navigate("", { trigger: true });
  //     }
  //   });
  // }

});
