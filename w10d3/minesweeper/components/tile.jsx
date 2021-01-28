import React from 'react';

class Tile extends React.Component {
  constructor() {
    super()

    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(e) {
    let flagged = false;
    // console.log(e.altKey)
    if (e.shiftKey === true) {
      flagged = true
    };
    console.log(flagged)
    this.props.updateGame(this.props.tile, flagged)
  }

  render() {
    let tile = this.props.tile;
    let bombCount = tile.adjacentBombCount();
    let display = " ";
    let tClass;

    if(tile.explored){
      if(bombCount){
        display = bombCount;
      }
      tClass = "explored";
    } else if(tile.flagged){
      display = "F"
      tClass = "flagged"
    } else if (tile.bombed) {
      display = "B";
      tClass = "bombed";
    }
    tClass = `tile ${tClass}`;


    return (
      <div className={tClass} onClick={this.handleClick}>{display}</div>
    )
  }

}

export default Tile;