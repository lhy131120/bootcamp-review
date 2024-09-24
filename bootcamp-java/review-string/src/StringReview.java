public class StringReview {

  public static void main(String[] args) {
    String s = "South China Morning Post";
    String s2 = "";

    // String method
    System.out.println("length(): " + s.length());
    System.out.println("charAt(3): " + s.charAt(3));
    System.out.println("isEmpty(): " + s.isEmpty());
    System.out.println("isBlank(): " + s2.isBlank());
    System.out.println("substring(int startIndex: 3): " + s.substring(3));
    System.out.println("substring(int startIndex: 3, int endIndex: 10): "
        + s.substring(3, 10));
    System.out.println("isLowerCase(): " + s.toLowerCase());
    System.out.println("isUpperCase(): " + s.toUpperCase());
    System.out.println("replace(\'o\', \'Z\'): " + s.replace('o', 'Z'));
    System.out.println("replace(without \'B\', \'Z\'): " + s.replace('B', 'Z'));
    System.out
        .println("replace(\"South\", \"shit\"): " + s.replace("South", "shit"));
  }
}
