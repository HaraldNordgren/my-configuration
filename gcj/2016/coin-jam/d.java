import java.util.Scanner;

public class d {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();
        int N = in.nextInt();
        int J = in.nextInt();
        int start = (int)Math.pow(2,(double)(N-1))+1;
        int end = (int)Math.pow(2,(double)(N))-1;
        int number = start;
        int[] binaryArr = new int[N];

        System.out.printf("Case #%d: \n", T);

        while (J>0 && number <= end ){
            String binary = Integer.toString(number, 2);
            
            for(int i = 0; i < binary.length(); i++) {
                binaryArr[i] = Integer.parseInt(String.valueOf(binary.charAt(i)));
            }
            String output = "";
            for (int k =2; k<11; k++){
                int out = findDiv(binaryArr, k);
                output += Integer.toString(out) + " ";
                if (out == 0) break;
                if (k == 10){
                    System.out.println(binary + " " + output  );
                    J--;
                }
            }
            number += 16 ;
        }
    }

    public static int numToBase(int[] binArr, int base) {
        int   results = 0;
        for (int j = 0 ; j < binArr.length ; j++){
            results += (int) (Math.pow(base, j) * (double) binArr[15-j]);
        }
        return results;
    }
    public static int findDiv(int[] binArr, int base){
        int newBase = numToBase(binArr, base);
        for (int i = 3 ; i <= newBase / 2; i++) {
            if (newBase % i == 0) {
                return i ;
            }
        }
        return 0;
    }

}
