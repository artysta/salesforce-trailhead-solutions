public class BankAcct {
    private Integer balance=0;
    public String acctName;
    //Declare a public string attribute named accttype
    public String accttype;
    //Declare a method, named makeDeposit, that accepts an integer named deposit
    //Within the method, add the deposit amount to the balance
    public void makeDeposit(Integer deposit) {
        balance = balance + deposit;
    }
    //Declare a method, named getBalance, that returns an integer
    public Integer getBalance() {
        //Return the balance attribute
        return balance;
    }
}