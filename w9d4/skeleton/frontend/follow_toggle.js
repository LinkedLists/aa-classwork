
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
    
    $.ajax({
      url: `/users/${this.userId}/follow`,
      type: "POST",
      success() {this.render()},
      error() {},
    })

  }
}

module.exports = FollowToggle;