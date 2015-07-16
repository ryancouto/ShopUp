ShopUp.Views.UserForm = Backbone.View.extend({

  template: JST['users/form'],

  initialize: function() {
    this.listenTo(this.model, 'sync change', this.render);
  },

  events: {
    'submit form': 'submit'
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
    var $form = $(event.currentTarget);
    var attrs = $form.serializeJSON().user;
    var view = this

    this.model.set(attrs);
    this.model.save({
      success: function () {
        ShopUp.currentUser.fetch();
        view.collection.add(view.model, { merge: true });
        Backbone.history.navigate('', { trigger: true });
        console.log('no errors')
      },
      error: function(data) {
        console.log('errors');
      }
    });
  }

})
