import React from 'react';

class Tile extends React.Component {
  constructor() {
    super()

    this.handleClick = this.handleClick.bind(this)
  }

  render() {
    let tile = this.props.tile;
    let bombCount = tile.adjacentBombCount();
    let display = " ";
    let tClass;

    if(tile.explored){
      if(tile.flagged){
        display = "F"
        tClass = "flagged"
      }else if(bombCount){
        display = bombCount;
        tClass = "explored";
      }
    }else if (tile.bombed) {
      display = "B";
      tClass = "bombed";
    }
    tClass = `tile ${tClass}`;


    return (
      <div className={tClass} onClick={this.handleClick}>{display}</div>
    )
  }

  handleClick(e) {
    let flagged = false;
    if (e.shiftlKey) flagged = true;
    console.log("click")
    this.props.updateGame(this.props.tile, flagged)
  }
}

export default Tile;