package Task1;

import java.util.List;
import java.util.ArrayList;

public class CategoryManager {
    // Create a JDBC object
    private final JDBC jdbc ;

    // Create lists for each category
    public List<Account> CIPAccounts= new ArrayList<>();
    public List<Account> VIPAccounts= new ArrayList<>();
    public List<Account> OrdinaryAccounts= new ArrayList<>();


public CategoryManager(JDBC jdbc){
        this.jdbc = jdbc;
        // Get the accounts and transactions from the database
        jdbc.getAccounts();
        jdbc.getTransactions();
        // Update the balance of each account
        for(Transaction transaction : jdbc.transactions){
            for(Account account : jdbc.accounts){
                if(transaction.getA_ID() == account.getA_ID()){
                    if(transaction.getT_TYPE().equals("0")){
                        account.setBalance(account.getBalance() + transaction.getT_AMOUNT());
                    }
                    else{
                        account.setBalance(account.getBalance() - transaction.getT_AMOUNT());
                    }
                }
            }
        }
    }

    private int getCIPAccounts(){
        double totalTransaction = 0;

        for(Account account : jdbc.accounts){
            for(Transaction transaction : jdbc.transactions){
                if(transaction.getA_ID() == account.getA_ID()){
                    //check if the balance is greater than 1000000
                    if(account.getBalance() > 1000000){
                        totalTransaction += transaction.getT_AMOUNT();
                        //check if the total transaction is greater than 5000000
                        if(totalTransaction > 5000000){
                            CIPAccounts.add(account);
                        }
                    }
                }
            }
        }

        return CIPAccounts.size();
    }

    private int getVIPAccounts(){
        double totalTransaction = 0;

        for(Account account : jdbc.accounts){
            for(Transaction transaction : jdbc.transactions){
                if(transaction.getA_ID() == account.getA_ID()){
                    if(account.getBalance() > 500000 && account.getBalance() < 900000){
                        totalTransaction += transaction.getT_AMOUNT();

                        if(totalTransaction > 2500000 && totalTransaction< 4500000){
                            VIPAccounts.add(account);
                        }
                    }
                }
            }
        }

        return VIPAccounts.size();
    }


    private int getOrdinaryAccounts(){
        double totalTransaction = 0;
        //loop through all accounts
        for(Account account : jdbc.accounts){
            //loop through all transactions
            for(Transaction transaction : jdbc.transactions){
                //check if the account id matches the transaction id
                if(transaction.getA_ID() == account.getA_ID()){
                    //check if the balance is less than 500000
                    if(account.getBalance() < 500000){
                        //add the transaction amount to the total transaction
                        totalTransaction += transaction.getT_AMOUNT();
                        //check if the total transaction is less than 2500000

                        if(totalTransaction < 2500000){
                            OrdinaryAccounts.add(account);
                        }
                    }
                }
            }
        }

        return OrdinaryAccounts.size();
    }

    // Print the number of accounts in each category
    public void printInfo(){
        System.out.println("CIP Accounts: " + getCIPAccounts());
        System.out.println("VIP Accounts: " + getVIPAccounts());
        System.out.println("Ordinary Accounts: " + getOrdinaryAccounts());
        System.out.println("Uncategorized Accounts: " + (jdbc.accounts.size() - (getCIPAccounts() + getVIPAccounts() + getOrdinaryAccounts())));
    }

}
