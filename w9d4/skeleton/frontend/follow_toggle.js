const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor($el) {
    this.$el     = $el;
    this.userId = $el.data('user-id');
    this.followState = $el.data("initial-follow-state");

    this.render();
  }

  render() {
    if(this.followState === 'unfollowed'){
      this.$el.text('Follow!');
    } else if (this.followState === 'followed') {
      this.$el.text('Unfollow!');
    }
  }

  handleClick(event) {
    event.preventDefault();
    
    const post_type  = this.followState === "followed"   ? "DELETE"   : "POST";
    this.followState = this.followState === "unfollowed" ? "followed" : "unfollowed";
    let user = this;
    APIUtil.followUser(user,post_type);
  }
}

module.exports = FollowToggle;