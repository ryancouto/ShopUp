ShopUp.Views.ShopForm = Backbone.View.extend({

  template: JST['shops/form'],

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click .shop-form-button': 'submit',
    'change #input-post-image': 'fileInputChange'
  },

  render: function () {
    var content = this.template({
      shop: this.model
    });

    this.$el.html(content);
    return this;
  },

  submit: function(event){
    event.preventDefault();

    var address = this.$(".address").val();
    var city = this.$(".city").val();
    var description = this.$(".description").val();
    var price = this.$('.price').val();
    var size = this.$('.size').val();
    var file = this.$("#input-post-image")[0].files[0];
    debugger
    var formData = new FormData();
    formData.append("shop[address]", address);
    formData.append("shop[city]", city);
    formData.append("shop[description]", description);
    formData.append("shop[price]", price);
    formData.append("shop[size]", size);
    formData.append("shop[image]", file);

    var that = this;

    $.ajax({
      url: '/api/shops',
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function () {
        that.collection.add(that.model);
        Backbone.history.navigate('', { trigger: true });
      },
      error: function (data) {
        console.log(data);
      }
    });
  },

  fileInputChange: function(event){
    console.log(event.currentTarget.files[0]);

    var that = this;
    var file = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function(){
      that._updatePreview(reader.result);
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      that._updatePreview("");
    }
  },

  _updatePreview: function(src){
    this.$el.find("#preview-post-image").attr("src", src);
  }
});
