package Code;

public class Forecast {
    public static double futureValueRecursive(double principal, double rate, int years) 
    {
        if (years == 0) {
            return principal; 
        }
        return futureValueRecursive(principal, rate, years - 1) * (1 + rate);
    }

    public static void main(String[] args) {
        double initialAmount = 1000.0;
        double growthRate = 0.10;
        int n = 5; 

        double result = futureValueRecursive(initialAmount, growthRate, n);
        System.out.printf("Future Value after %d years: %.2f%n", n, result);
    }
}
