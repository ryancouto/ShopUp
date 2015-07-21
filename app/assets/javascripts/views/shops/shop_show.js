ShopUp.Views.ShopShow = Backbone.View.extend({

  template: JST['shops/show'],

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render);
    this.reservations = options.reservations;
    this.listenTo(this.reservations, 'sync change add remove', this.render);
    this.listenTo(ShopUp.currentUser, 'sync add change remove', this.render);
  },

  events: {
    'click .request-button': 'submitRequest',
    'click .approve': 'approveRequest',
    'click .reject': 'rejectRequest',
    'click .delete-request': 'deleteRequest'
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
    this.$( "#datepicker3" ).datepicker();
    this.$( "#datepicker4" ).datepicker();
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

    request.save({
      owner_id: this.model.get('owner_id').toString(),
      renter_id: ShopUp.currentUser.id.toString(),
      shop_id: this.model._previousAttributes.id.toString(),
      start_day: this.dateParser($('#datepicker3').val()),
      end_day: this.dateParser($('#datepicker4').val()),
      approved: false
    }, {
      success: function () {
        view.reservations.add(request, { merge: true })
        view.render()
        view.$el.append('Reservation successfully requested');
      },
      error: function(data) {
        view.$el.append('Request unsuccessful, please try again');
      }
    });
  },

  approveRequest: function (event) {
    event.preventDefault();
    var view = this
    var id = $(event.currentTarget).data('id');
    var res = ShopUp.Collections.reservations.getOrFetch(id);
    res.save({'approved': true},{
      success: function () {
        view.reservations.add(res, { merge: true })
        view.$el.append('Request approved');
      },
      error: function (data) {
        console.log(data);
      }
    });
  },

  rejectRequest: function (event) {
    event.preventDefault();
    var view = this
    var id = $(event.currentTarget).data('id');
    var res = ShopUp.Collections.reservations.getOrFetch(id);
    res.save({'approved': false},{
      success: function () {
        view.reservations.add(res, { merge: true })
        view.$el.append('Request rejected');
      },
      error: function (data) {
        console.log(data);
      }
    });
  },

  deleteRequest: function (event) {
    event.preventDefault();
    var view = this
    var id = $(event.currentTarget).data('id');
    var res = ShopUp.Collections.reservations.getOrFetch(id);
    res.destroy({
      success: function () {
        view.reservations.remove(res)
      }
    })
  }


});
