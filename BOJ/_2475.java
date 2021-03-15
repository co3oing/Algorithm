import java.util.Scanner;

public class Main{
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		int str[] = new int[5];
		int answer = 0;

		for(int i = 0; i < str.length; i++){
			str[i] = sc.nextInt();
			answer += (str[i] * str[i]);	
		}
		answer %= 10;
		System.out.println(answer);
	}
}
