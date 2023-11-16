package Task1;

public class Main {
    public static void main(String[] args) {
        JDBC database = new JDBC("N_210042170", "cse4308");
        CategoryManager categoryManager= new CategoryManager(database);
        categoryManager.printInfo();
    }
}
