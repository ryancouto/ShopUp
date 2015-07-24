ShopUp.Views.LogIn = Backbone.View.extend({

  template: JST['shared/log_in'],

  events: {
    'click .log-in': 'submit',
    'click #google-login': 'oAuthLogin',
    'click .guest': 'guestLogin'
  },

  initialize: function (options) {
    this.callback = options.callback;
    // this.listenTo(ShopUp.currentUser, 'signIn', this.signInCallback);
  },

  render: function () {
    this.$el.html(this.template());

    return this;
  },

  oAuthLogin: function(event){
    event.preventDefault();
    window.location = '/auth/google_oauth2/';
  },

  submit: function(event){
    event.preventDefault();
    var formData = $('.form-log-in').serializeJSON().user;
    var view = this

    ShopUp.currentUser.signIn({
      email: formData.email,
      password: formData.password,
      success: function () {
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

  guestLogin: function () {
    event.preventDefault();

    var view = this

    ShopUp.currentUser.signIn({
      email: 'guest@gmail.com',
      password: 'password',
      success: function () {
        Backbone.history.navigate('/#', { trigger: true })
      },
      error: function(){
        alert("Wrong username/password combination. Please try again.");
      }
    });
  }

  // signInCallback: function(event){
  //   if(this.callback) {
  //     this.callback();
  //   } else {
  //     Backbone.history.navigate("/#/shops", { trigger: true });
  //   }
  // }

});
