import React from 'react';
import Tile from './tile';
import * as Minesweeper from './minesweeper'

class Board extends React.Component {
  constructor() {
    super()
  }

  render() {
    return (
      <div>
        <h2>Board rendering</h2>
        {this.props.board.grid.map((tileArr, i) => {
          return <div className="tile-row" key={`row-${i}`}>{tileArr.map((tile, j) => {
            return <div className="tile-container" key={`tile-${i}, ${j}`}><Tile tile={tile} updateGame={this.props.updateGame}/></div>
          })}</div>
        })}
      </div>
    )
  }
}

export default Board;