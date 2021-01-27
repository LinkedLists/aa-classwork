import React from 'react';

class Tile extends React.Component {
  constructor() {
    super()
  }

  render() {
    let tile = this.props.tile;
    let bombCount = tile.adjacentBombCount();
    let display = "T";
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
      <div className={tClass}>{display}</div>
    )
  }
}

export default Tile;