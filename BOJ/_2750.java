import java.util.Arrays;
import java.util.Scanner;

public class _2750 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int N = sc.nextInt();
		int[] num = new int[N];
		for(int i = 0; i < N; i++) {
			num[i] = sc.nextInt();
		}
		
		Arrays.sort(num);
		
		for(int numValue : num) {
			System.out.println(numValue);
		}
	}

}
