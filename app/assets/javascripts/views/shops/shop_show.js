ShopUp.Views.ShopShow = Backbone.View.extend({

  template: JST['shops/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click .request-button': 'submitRequest'
  },

  render: function () {
    var content = this.template({
      shop: this.model
    });
    this.$el.html(content);
    this.createDatepicker();
    return this;
  },

  createDatepicker: function () {
    $( "#datepicker" ).datepicker();
    $( "#datepicker2" ).datepicker();
  },

  dateParser: function (date) {
    var unparsed = $.datepicker.parseDate("mm/dd/yy", date)
    var month = unparsed.getMonth() + 1;
    var date = unparsed.getDate();
    var year = unparsed.getFullYear();
    var day = unparsed.getDay();
    return year + '-' + month + '-' + date
  },

  submitRequest: function (event) {
    event.preventDefault();

    var view = this;
    var request = new ShopUp.Models.Reservation({
      owner_id: view.model.get('owner_id'),
      renter_id: ShopUp.currentUser.id,
      shop_id: view.model.id,
      start_day: view.dateParser($('#datepicker').val()),
      end_day: view.dateParser($('#datepicker2').val()),
      approved: false
    });

    request.save({}, {
      succes: function () {
        console.log('woohoo')
      },
      error: function(data) {
        console.log('bummer')
      }
    })
  }

});
