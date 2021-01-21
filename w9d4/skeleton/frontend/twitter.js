const FollowToggle = require("./follow_toggle.js");

$(() => {
  console.log('sdf');
  const $followToggle = $('.follow-toggle');
  debugger
  $followToggle.forEach((ele) => {
    const f_toggle = new FollowToggle(ele);
  })
});