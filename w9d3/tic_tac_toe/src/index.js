const View = require("./ttt-view.js") // require appropriate file
const Game = require("./../node_solutions/game.js") // require appropriate file

  $(() => {
    // Your code here
    const game = new Game();
    // const $ul = $("<ul class='grid'></ul>")
    const $ul = $("ul")
    const view = new View(game, $ul);
    view.bindEvents();
  });
