class Timer {
  int savedTime, totalTime;
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
    
    void start() {
      savedTime = millis();
    }
    
    boolean isfinished() {
      int passedTime = millis() - savedTime;
      if(passedTime > totalTime) {
        return true;
      }
      else {
        return false;
      }
    }
  }
}