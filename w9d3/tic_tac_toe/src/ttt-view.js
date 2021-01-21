class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {
    this.$el.on("click", "li", (e) => {
      // const pos = e.currentTarget.data('pos');
      // // debugger
      // this.game.playmove(pos);
      const $square = $(e.currentTarget);
      this.makeMove($square);
      // $square.toggleClass("clicked")
    })
  }

  makeMove($square) {
    // debugger
    const pos = $square.data("pos");
    const mark = this.game.currentPlayer;
    this.game.playMove(pos);
    $square.text(mark);
    $square.addClass(`${mark}`);
    if (this.game.isOver() !== null) {
      $(`${mark}`).attr("style", "background-color: green");
    }
  }

  setupBoard() {
    // const $ul = $("<ul class='grid'></ul>")
    // for (let i = 0; i < 9; i++) {
    //   const $li = $("<li></li>");
    //   const pos = [i / 3, i % 3];
    //   $li.data("pos", pos);
    //   this.$el.append($li);
    // }
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        const $li = $("<li></li>");
        const pos = [row, col];
        $li.data("pos", pos);
        this.$el.append($li);
      }
    }
  }  
}


      


module.exports = View;
