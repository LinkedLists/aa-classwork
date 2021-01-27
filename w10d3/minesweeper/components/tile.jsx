import React from 'react';

class Tile extends React.Component {
  constructor() {
    super()
  }

  render() {
    let bombCount = this.props.tile.adjacentBombCount();
    let display = "T";
    let tClass;
    if(this.props.tile.explored){
      if(bombCount){
        display = bombCount;
        tClass = "explored";
      }
    } else if (this.props.tile.flagged) {
      display = "F";
      tClass = "flagged";
    } else if (this.props.tile.bombed) {
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