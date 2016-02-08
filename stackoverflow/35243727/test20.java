import java.util.Scanner;
import java.util.Arrays;

public class test20 {

  private static int readNumber(Scanner userInput) {
    int nbr;

    while (true) {
      while(!userInput.hasNextInt()) {
        System.out.println("Enter valid integer!");
        userInput.next();
      }

      nbr = userInput.nextInt();

      if (nbr >= 1 && nbr <= 7) {
        return nbr;
      } else {
        System.out.println("Enter number in range 1 to 7!");
      }
    }
  }

  private static int count(int input, int[] nums) {
      int count = 0;

      for (int i = 0; i < nums.length; i++){
        if (nums[i] == input){
          count++;
        } else if (nums[i] > input) {
          break;
        }
      }

      return count;
  }

  public static void main(String[] args) {

    Scanner userInput = new Scanner(System.in);

    int[] nums = new int[16];

    for (int i = 0; i < nums.length; i++) {
      nums[i] = readNumber(userInput);
    }

    Arrays.sort(nums);
    System.out.println ("Sorted numbers: " + Arrays.toString(nums));
  
    int input = 0;

    while(true) {

      System.out.println("Search for a number in array");

      input = readNumber(userInput);
      System.out.println("The number you chose to search for is " + input);

      System.out.println("This occurs " + 
        count(input, nums) + " times in the array");
    }
  }
}
