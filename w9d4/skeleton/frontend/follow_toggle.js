
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
    
    const post_type  = this.followState === "followed" ? "DELETE" : "POST";
    this.followState = this.followState === "unfollowed" ? "followed" : "unfollowed";
    let that = this;
    $.ajax({
      url: `/users/${this.userId}/follow`,
      type: post_type,
      success() {
        that.render();
        debugger;
      },
      error(e) { alert("whoops"); debugger},
    })
  }
}

module.exports = FollowToggle;