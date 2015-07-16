ShopUp.Collections.Users = Backbone.Collection.extend({
  url: "/api/users",
  model: ShopUp.Models.User,

  getOrFetch: function(id) {
    var user = this.get(id),
        users = this;

    if(!user) {
      user = new this.model({ id: id });
      user.fetch({
        success: function() {
          users.add(user);
        }
      });
    } else {
      user.fetch();
    }

    return user;
  }
});

ShopUp.Collections.users = new ShopUp.Collections.Users()
