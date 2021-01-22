const APIUtil = {
  followUser(user,post_type) {
    $.ajax({
      url: `/users/${user.userId}/follow`,
      type: post_type,
      dataType: 'json',
      success() {user.render();},
      error(e) { alert("whoops"); debugger},
    });
  },
};


module.exports = APIUtil;