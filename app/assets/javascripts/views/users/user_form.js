ShopUp.Views.UserForm = Backbone.View.extend({

  template: JST['users/form'],

  initialize: function() {
    this.listenTo(this.model, 'sync change', this.render);
  },

  events: {
    'click .sign-up': 'submit'
  },

  render: function () {
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = $('.user-form').serializeJSON().user;
    var view = this
    this.model.save( attrs, {
      success: function () {
        ShopUp.currentUser.fetch();
        view.collection.add(view.model, { merge: true });
        Backbone.history.navigate('', { trigger: true });
      },
      error: function(data) {
        console.log(data);
      }
    });
  }

})
