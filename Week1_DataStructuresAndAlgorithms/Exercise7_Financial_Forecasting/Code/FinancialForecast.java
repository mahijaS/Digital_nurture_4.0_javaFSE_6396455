
public class FinancialForecast {
    public static void main(String[] args) {
        double principal = 20000;
        double rate = 0.07;
        int years = 10;

        double futureValue = forecast(principal, rate, years);
        System.out.println("Forecasted value after " + years + " years: " + futureValue);
    }

    public static double forecast(double amount, double rate, int years) {
        if (years == 0) return amount;
        return forecast(amount * (1 + rate), rate, years - 1);
    }
}
