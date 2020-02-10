class Clock {

  constructor() {
    let time = new Date();
    this.hour = time.getHours();
    this.minute = time.getMinutes();
    this.seconds = time.getSeconds();
    // set ticks at 1 second intervals
  }

  printTime() {
    if(this.seconds === 60) {
      this.minute += 1;
      this.seconds = 0;
    } 
    if(this.minute === 60) {
      this.hour += 1;
      this.minute = 0;
    }
    if (this.hour === 24) {
      this.hour = 0;
    } 
    let ss = this.seconds < 10 ? `0${this.seconds}` : `${this.seconds}`;
    let mm = this.minute < 10 ? `0${this.minute}` : `${this.minute}`;
    let hh = this.hour < 10 ? `0${this.hour}` : `${this.hour}`;
    let time = `${hh}:${mm}:${ss}`;
    console.log(time);
  }

  _tick() {
    this.seconds += 1;
    this.printTime();
  }


}

let time = new Clock();
setInterval(() => {
  time._tick();
}, 1000);