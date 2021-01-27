import React from 'react';

class Tile extends React.Component {
  constructor() {
    super()
  }

  render() {
    let bombCount = this.props.tile.adjacentBombCount();
    let display = "T";
    if(this.props.tile.explored){
      if(bombCount){
        display = bombCount;
      }
    }
    return (
      <div>{display}</div>
    )
  }
}

export default Tile;