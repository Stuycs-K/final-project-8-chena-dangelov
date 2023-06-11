// the controller class is for the holding 'h' tool explained in the more info box
class Controller {
  static final int P1_LEFT = 0;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[1];//1 valid button
  }

  /**@param code: a valid constant e.g. P1_LEFT
  */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if(code == 'H')
      inputs[P1_LEFT] = true;
  }
  void release(int code) {
    if(code == 'H')
    inputs[P1_LEFT] = false;
  }
}
