import React from 'react';
import Tile from './tile';
import * as Minesweeper from './minesweeper'

class Board extends React.Component {
  constructor() {}

  render() {
    return (
      <div>
        {this.props.board.map((tileArr, i) => {
          <div key={`row-${i}`}>{tileArr.map((tile, j) => {
            let newTile = new Minesweeper.Tile(this.props.board, [i, j]);
            return <div key={`tile-${i}, ${j}`}><Tile tile={newTile} updateGame={this.props.updateGame}/></div>
          })}</div>
        })}
      </div>
    )
  }
}

export default Board;