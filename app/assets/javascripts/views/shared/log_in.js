ShopUp.Views.LogIn = Backbone.View.extend({

  template: JST['shared/log_in'],

  events: {
    'click .log-in': 'submit'
  },

  initialize: function (options) {
    this.callback = options.callback;
    // this.listenTo(ShopUp.currentUser, 'signIn', this.signInCallback);
  },

  render: function () {
    this.$el.html(this.template());

    return this;
  },

  submit: function(event){
    event.preventDefault();
    var formData = $('.form-log-in').serializeJSON().user;
    var view = this

    ShopUp.currentUser.signIn({
      email: formData.email,
      password: formData.password,
      success: function () {
        debugger
        $(view.$('input')).each( function() {
          $(this).val("");
        });
        Backbone.history.navigate('/#', { trigger: true })
      },
      error: function(){
        alert("Wrong username/password combination. Please try again.");
      }
    });
  },

  // signInCallback: function(event){
  //   if(this.callback) {
  //     this.callback();
  //   } else {
  //     Backbone.history.navigate("/#/shops", { trigger: true });
  //   }
  // }

});