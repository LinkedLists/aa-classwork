const { ids } = require("webpack");

class FollowToggle {
  constructor($el) {
    this.$el     = $el;
    this.user_id = $el.data('user-id');
  }
}

module.exports = FollowToggle;