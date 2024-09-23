public class Function {
  private String firstName;
  private String lastName;

  public Function() {

  }

  public Function(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  public String getName() {
    return firstName + lastName;
  }

  public void setName(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  public String toString() {
    return "(Name :, " + this.lastName + " " + this.firstName + ")";
  }

  public static void main(String[] args) {
    Function fn = new Function("Tom", "Chan");
    Function fn2 = new Function();
    fn2.setName("Chris", "Paul");
    System.out.println(fn);
    System.out.println(fn2);
  }
}
