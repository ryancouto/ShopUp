ShopUp.Views.ShopShow = Backbone.View.extend({

  template: JST['shops/show'],

  initialize: function (options) {
    this.reservations = options.reservations;
    this.reviews = options.reviews;

    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.reservations, 'sync change add remove', this.render);
    this.listenTo(ShopUp.currentUser, 'sync add change remove', this.render);
    this.listenTo(this.reviews, 'sync add change remove', this.render);
    this.listenTo(this.users, 'sync', this.render)
  },

  events: {
    'click .request-button': 'submitRequest',
    'click .approve': 'approveRequest',
    'click .reject': 'rejectRequest',
    'click .delete-request': 'deleteRequest',
    'click .write-review': 'insertReviewForm',
    'click .review-form-submit': 'submitReview'
  },

  render: function () {
    var content = this.template({
      shop: this.model,
    });
    this.$el.html(content);
    this.createDatepicker();
    return this;
  },

  createDatepicker: function () {
    var dateToday = new Date()
    this.$( "#datepicker3" ).datepicker({
      minDate: dateToday
    });
    this.$( "#datepicker4" ).datepicker({
      minDate: dateToday
    });
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
      },
      error: function(data) {
        alert('Request unsuccessful, please check dates and try again');
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
        view.reservations.add(res, { merge: true });
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
        view.reservations.add(res, { merge: true });
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
  },

  insertReviewForm: function (event) {
    event.preventDefault();
    var $but = $('.review-button');
    $but.empty();
    var $div = $('.review-form-insert')
    $div.html("<form class='review-form'><input type='text' name='review[title]' placeholder='Title' class='review-title'><textarea rows='5' cols='40' type='string' name='review[body]' placeholder='Write your review here' class='review-body'></textarea><button class='review-form-submit'>Post Review</button></form>");
  },

  submitReview: function (event) {
    debugger
    event.preventDefault();
    var view = this
    var attrs = $('.review-form').serializeJSON().review;
    var review = new ShopUp.Models.Review();
    review.save({
      shop_id: this.model.id.toString(),
      user_id: ShopUp.currentUser.id.toString(),
      body: attrs.body,
      title: attrs.title,
      username: ShopUp.currentUser.get('fname'),
      lname: ShopUp.currentUser.get('lname')
    }, {
      success: function () {
        view.reviews.add(review);
      },
      error: function (data) {
        alert('Not a valid review. Review must have content. Please try again.')
        console.log(data);
      }
    });
  }


});
