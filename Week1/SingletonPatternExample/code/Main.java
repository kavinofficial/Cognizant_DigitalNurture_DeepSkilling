public class Main {
    public static void main(String[] args) {
        Logger log1 = Logger.getInstance();
        log1.log("First log message.");

        Logger log2 = Logger.getInstance();
        log2.log("Second log message.");

        if (log1 == log2) 
        {
            System.out.println("Both logger instances are the same. Singleton confirmed.");
        } 
        else 
        {
            System.out.println("Different logger instances. Singleton failed.");
        }
    }
}
