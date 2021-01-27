
import React from 'react';

class Clock extends React.Component{
    constructor(props) {
      super(props);
      // 1. Create a Date object.
      this.state = {
        hours: '',
        minutes: '',
        seconds: '',
        year: '',
        month: '',
        day: ''
      }


      this._tick = this._tick.bind(this);
    }
  
    _tick() {
      
      const currentTime = new Date();
      const seconds = currentTime.getSeconds();
      const minutes = currentTime.getMinutes();
      const hours = currentTime.getHours();
      const year = currentTime.getFullYear();
      const month = currentTime.getMonth();
      const day = currentTime.getDate();
      // const weekDay = currentTime.getDay();
      this.setState({ seconds, minutes, hours, year, month, day })
    }

    componentDidMount() {
      this.clokInterval =  setInterval(this._tick, 1000);
    }

    componentWillUnmount() {
      clearInterval(this.clokInterval);
    }
  


    render() {
        const arr = Object.values(this.state).slice(0, 3).map((num) => {
          if(num < 10){ 
            let n = '0' + num.toString();
            return n;
          }
          return num;
        });
        return (
            <>
              <h1 className="clock">{arr[0]}:{arr[1]}:{arr[2]}</h1>
              <br/>
              <h1 className="date">{this.state.month + 1} / {this.state.day} / {this.state.year}</h1>

              {/* Tue Jan 26 2021 */}
            </>
        );
    };
  }

  export default Clock;