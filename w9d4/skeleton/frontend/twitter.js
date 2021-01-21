const FollowToggle = require("./follow_toggle.js");

$(() => {
  console.log('sdf');
  const $followToggle = $('.follow-toggle');
  $followToggle.each((_, ele) => {
    const f_toggle = new FollowToggle($(ele));
    //debugger
    $(ele).on('click', event => f_toggle.handleClick(event));
  })
});