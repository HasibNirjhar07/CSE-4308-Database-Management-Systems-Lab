package Task1;

import java.sql.Date;

public class Transaction {
    private final int T_ID;
    private final int A_ID;
    private final double T_AMOUNT;
    private final String T_TYPE;

    public Transaction(int T_ID, Date dtm, int A_ID, double T_AMOUNT, String T_TYPE) {
        this.T_ID = T_ID;
        this.A_ID = A_ID;
        this.T_AMOUNT = T_AMOUNT;
        this.T_TYPE = T_TYPE;
    }

    public int getT_ID() {
        return T_ID;
    }

    public int getA_ID() {
        return A_ID;
    }

    public String getT_TYPE() {
        return T_TYPE;
    }

    public double getT_AMOUNT() {
        return T_AMOUNT;
    }

    public String toString() {
        return "Transaction ID: " + T_ID + "\n" +
                "Account ID: " + A_ID + "\n" +
                "Transaction Amount: " + T_AMOUNT + "\n" +
                "Transaction Type: " + T_TYPE + "\n";
    }
}
