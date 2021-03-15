import java.util.Scanner;

public class _1075 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int N, F;
		N = sc.nextInt();
		F = sc.nextInt();
		int tmp = N % 100;
		int answer = 0;

		for(int i = N - tmp; i < N - tmp + 100; i++) {
			if(i % F == 0) {
				answer = i % 100;
				break;
			}
		}
		
		if((answer % 10) == answer) {
			System.out.print(0);
		}
		System.out.println(answer);
		
	}

}
