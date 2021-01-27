import React from 'react';
import Tile from './tile';

class Board extends React.Component {
  constructor() {}

  render() {
    return (
      <div>
        {this.props.board.map((tileArr, i) => {
          <div>{tileArr.map((tile, j) => {
            let newTile = new Tile(tile, this.props.updateGame)
          })}</div>
        })}
      </div>
    )
  }
}

export default Board;