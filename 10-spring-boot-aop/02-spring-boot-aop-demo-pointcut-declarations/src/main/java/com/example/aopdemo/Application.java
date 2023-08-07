package com.example.aopdemo;

import com.example.aopdemo.dao.AccountDAO;
import com.example.aopdemo.dao.MembershipDAO;
import com.example.aopdemo.service.TrafficFortuneService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.List;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CommandLineRunner commandLineRunner(
            AccountDAO theAccountDAO,
            MembershipDAO theMembershipDAO,
            TrafficFortuneService theTrafficFortuneService
    ) {
        return runner -> {
//            demoTheBeforeAdvice(theAccountDAO, theMembershipDAO);
//            demoTheAfterReturningAdvice(theAccountDAO);
//            demoTheAfterThrowingAdvice(theAccountDAO);
//            demoTheAfterAdvice(theAccountDAO);
//            demoTheAroundAdvice(theTrafficFortuneService);
//            demoTheAroundAdviceHandleException(theTrafficFortuneService);
            demoTheAroundAdviceRethrowException(theTrafficFortuneService);
        };
    }

    private void demoTheAroundAdviceRethrowException(TrafficFortuneService theTrafficFortuneService) {
        System.out.println("\nMain Program: demoTheAroundAdviceRethrowException");
        System.out.println("Calling getFortune()");

        boolean tripWire = true;
        String data = theTrafficFortuneService.getFortune(tripWire);
        System.out.println("\nMy fortune is: " + data);
        System.out.println("Finished");
    }

    private void demoTheAroundAdviceHandleException(TrafficFortuneService theTrafficFortuneService) {
        System.out.println("\nMain Program: demoTheAroundAdviceHandleException");
        System.out.println("Calling getFortune()");

        boolean tripWire = true;
        String data = theTrafficFortuneService.getFortune(tripWire);
        System.out.println("\nMy fortune is: " + data);
        System.out.println("Finished");
    }

    private void demoTheAroundAdvice(TrafficFortuneService theTrafficFortuneService) {
        System.out.println("\nMain Program: demoTheAroundAdvice");
        System.out.println("Calling getFortune()");

        String data = theTrafficFortuneService.getFortune();
        System.out.println("\nMy fortune is: " + data);
        System.out.println("Finished");
    }

    private void demoTheAfterAdvice(AccountDAO theAccountDAO) {
        // call method to find the accounts
        List<Account> theAccounts = null;

        try {
            // simulate a boolean flag to simulate exceptions
            boolean tripWire = false;
            theAccounts = theAccountDAO.findAccounts(tripWire);
        } catch (Exception exc) {
            System.out.println("\n\nMain Program: ... caught exception: " + exc);
        }

        // display the accounts
        System.out.println("\n\nMain Program: demoTheAfterThrowingAdvice");
        System.out.println("----");

        System.out.println(theAccounts);

        System.out.println("\n");
    }

    private void demoTheAfterThrowingAdvice(AccountDAO theAccountDAO) {
        // call method to find the accounts
        List<Account> theAccounts = null;

        try {
            // simulate a boolean flag to simulate exceptions
            boolean tripWire = true;
            theAccounts = theAccountDAO.findAccounts(tripWire);
        } catch (Exception exc) {
            System.out.println("\n\nMain Program: ... caught exception: " + exc);
        }

        // display the accounts
        System.out.println("\n\nMain Program: demoTheAfterThrowingAdvice");
        System.out.println("----");

        System.out.println(theAccounts);

        System.out.println("\n");
    }

    private void demoTheAfterReturningAdvice(AccountDAO theAccountDAO) {
        // call method to find the accounts
        List<Account> theAccounts = theAccountDAO.findAccounts();

        // display the accounts
        System.out.println("\n\nMain Program: demoTheAfterReturningAdvice");
        System.out.println("----");

        System.out.println(theAccounts);

        System.out.println("\n");
    }

    private void demoTheBeforeAdvice(AccountDAO theAccountDAO, MembershipDAO theMembershipDAO) {
        Account myAccount = new Account();
        myAccount.setName("Madhu");
        myAccount.setLevel("Platinum");
        // call the business method
        theAccountDAO.addAccount(myAccount, true);
        theAccountDAO.doWork();

        // call the accountdao getter/setter methods
        theAccountDAO.setName("foobar");
        theAccountDAO.setServiceCode("silver");

        String name = theAccountDAO.getName();
        String code = theAccountDAO.getServiceCode();

        // call the business method
        theMembershipDAO.addSillyMember();
        theMembershipDAO.goToSleep();
    }
}
