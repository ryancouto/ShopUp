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
    console.log('creating datepicker')
    $( "#datepicker" ).datepicker();
    $( "#datepicker2" ).datepicker();
  },

  dateParser: function (date) {
    var unparsed = $.datepicker.parseDate("mm/dd/yy", date)
    var month = unparsed.getMonth() + 1;
    var date = unparsed.getDate();
    var year = unparsed.getFullYear();
    return $.datepicker.parseDate("dd/mm/yy", date+'/'+month+'/'+year)
  },

  submitRequest: function () {
    var startDay = this.dateParser($('#datepicker').val());
    var endDay = this.dateParser($('#datepicker2').val());
    // current_user shop_id stuff
  }

})
