ShopUp.Views.SignIn = Backbone.View.extend({

  template: JST['shared/sign_in'],

  events: {
    'submit form': 'submit'
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
    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON().user;
    var view = this

    ShopUp.currentUser.signIn({
      email: formData.email,
      password: formData.password,
      success: function () {
        $(view.$('input')).each( function() {
          $(this).val("");
        });
        Backbone.history.navigate('#/shops', { trigger: true })
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
