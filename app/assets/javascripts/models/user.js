ShopUp.Models.User = Backbone.Model.extend({

  urlRoot: '/api/users',

  toJSON: function () {
    var json = { user: _.clone(this.attributes) };
    return json
  },

  shops: function () {
    if (!this._shops) {
      this._shops = new ShopUp.Collections.Shops([], { user: this });
    }
    return this._shops
  },

  parse: function (response) {
    if (response.shops) {
      this.shops().set(response.shops, { parse: true });
      delete response.shops;
    }
    return response
  }
});

ShopUp.Models.CurrentUser = ShopUp.Models.User.extend({

  url: '/api/session',

  initialize: function (options) {
    this.listenTo(this, "change", this.fireSessionEvent);
  },

  isSignedIn: function () {
    return !this.isNew();
  },

  signIn: function(options){
    var model = this;
    var credentials = {
      "user[email]": options.email,
      "user[password]": options.password
    };

    $.ajax({
      url: this.url,
      type: "POST",
      data: credentials,
      dataType: "json",
      success: function(data){
        model.set(data);
        options.success && options.success();
        Backbone.history.navigate('/#/shops')
      },
      error: function(){
        options.error && options.error();
      }
    });
  },

  signOut: function(options){
    var model = this;

    $.ajax({
      url: this.url,
      type: "DELETE",
      dataType: "json",
      success: function(data){
        model.clear();
        options.success && options.success();
      }
    });
  },

  fireSessionEvent: function(){
    if(this.isSignedIn()){
      this.trigger("signIn");
    } else {
      this.trigger("signOut");
    }
  }

});
