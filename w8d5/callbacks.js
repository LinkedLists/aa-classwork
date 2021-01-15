console.log("hi")

class Clock {
    constructor() {
        // 1. Create a Date object.
        this.date = new Date() //.toLocaleTimeString("en-US").split(/:| /)
        // 2. Store the hours, minutes, and seconds.
        this.hours = this.date.getHours()
        this.minutes = this.date.getMinutes()
        this.seconds = this.date.getSeconds()
        // 3. Call printTime.
        this.printTime(this.hours, this.minutes, this.seconds)
        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this),1000)
    }

    printTime(hours, minutes, seconds) {
        // Format the time in HH:MM:SS

        // Use console.log to print it.
        console.log(`${hours}:${minutes}:${seconds}`)
    }
    
    _tick() {
        // console.log(this)
        // 1. Increment the time by one second.
        this._incrementSeconds();
        // 2. Call printTime.
        this.printTime(this.hours, this.minutes, this.seconds)
    }
    
    _incrementSeconds() {
        this.seconds++;
        if (this.seconds === 60) {
            this.minute = 0;
            this._incrementMinutes();
        }
    }
    
    _incrementMinutes() {
        this.minute++;
        if (this.minute === 60) {
            this.minute = 0;
            this._incrementHours();
        }
    }
    
    _incrementHours() {
        this.hours++;
        if (this.hours === 24) {
            this.hours = 0;
        }
    }
}

const clock = new Clock();

function addNumbers(sum, numLeft, completionCallback)