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
    this.$( "#datepicker" ).datepicker();
    this.$( "#datepicker2" ).datepicker();
  },

  dateParser: function (date) {
    var unparsed = $.datepicker.parseDate("mm/dd/yy", date)
    var month = unparsed.getMonth();
    var date = unparsed.getDate();
    var year = unparsed.getFullYear();
    var day = unparsed.getDay();
    var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    return days[day] + ', ' + date + ' ' + months[month] + ' ' + year
  },

  submitRequest: function (event) {
    event.preventDefault();

    var view = this;
    var request = new ShopUp.Models.Reservation();
    debugger

    request.save({
      owner_id: this.model.get('owner_id').toString(),
      renter_id: ShopUp.currentUser.id.toString(),
      shop_id: this.model._previousAttributes.id.toString(),
      start_day: this.dateParser($('#datepicker').val()),
      end_day: this.dateParser($('#datepicker2').val()),
      approved: false
    }, {
      success: function () {
        console.log('woohoo')
      },
      error: function(data) {
        console.log(data)
        console.log(view.model.id)
      }
    });
  }

});
