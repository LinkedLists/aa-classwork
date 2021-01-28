import React from 'react';
import Board from "./board"
import * as Minesweeper from "./minesweeper"

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = { board: new Minesweeper.Board(9, 10) };
    this.updateGame = this.updateGame.bind(this);
    this.gameState = this.state.board.won();
  }

  updateGame(tile, flagged) {
    if(flagged){
      tile.toggleFlag();
    }else{
      tile.explore();
    }
    if(tile.board.won()){

    }else if(tile.board.lost()){
      
    }
    this.setState({ board: tile.board })
  }

  render() {
    return (
      <div className="game-div">
        <h1>Rendering</h1>
        <Board board={this.state.board} updateGame={this.updateGame}/>
      </div>
    )
  }
}

export default Game;