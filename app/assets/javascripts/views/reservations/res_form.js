ShopUp.Views.ResForm = Backbone.View.extend({

  template: JST['reservations/form'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click .res-form-button': 'submit'
  },

  render: function () {
    var content = this.template({
      reservation: this.model
    });

    this.$el.html(content);
    return this;
  },

  submit: function () {
    var attrs = this.$el.serializeJSON();
    var view = this
    this.model.set(attrs);
    this.model.save({
      success: function () {
        view.collection.add(view.model, { merge: true });
        Backbone.history.navigate('res/'+view.model.id, { trigger: true })
      }
    })
  }

});
