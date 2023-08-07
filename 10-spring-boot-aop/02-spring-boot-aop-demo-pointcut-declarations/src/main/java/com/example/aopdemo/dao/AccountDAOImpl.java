package com.example.aopdemo.dao;

import com.example.aopdemo.Account;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class AccountDAOImpl implements AccountDAO {

    private String name;
    private String serviceCode;

    @Override
    public void addAccount(Account theAccount, boolean vipFlag) {
        System.out.println(getClass() + ": DOING MY DB WORK: ADDING AN ACCOUNT");
    }

    @Override
    public boolean doWork() {
        System.out.println(getClass() + ": doWork()");
        return false;
    }

    @Override
    public List<Account> findAccounts() {
        return findAccounts(false);
    }

    @Override
    public List<Account> findAccounts(boolean tripWire) {

        // for academic purposes ... simulate an exception
        if (tripWire) {
            throw new RuntimeException("Trip Wire Triggered Exception");
        }

        List<Account> myAccounts = new ArrayList<>();

        Account tempAccount1 = new Account("John", "Silver");
        Account tempAccount2 = new Account("Madhu", "Platium");
        Account tempAccount3 = new Account("Luca", "Gold");

        myAccounts.add(tempAccount1);
        myAccounts.add(tempAccount2);
        myAccounts.add(tempAccount3);

        return myAccounts;
    }

    public String getName() {
        System.out.println(getClass() + ": inGetName()");
        return name;
    }

    public void setName(String name) {
        System.out.println(getClass() + ": inSetName()");
        this.name = name;
    }

    public String getServiceCode() {
        System.out.println(getClass() + ": inGetServiceCode()");
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        System.out.println(getClass() + ": inSetServiceCode()");
        this.serviceCode = serviceCode;
    }
}
