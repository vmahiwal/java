package com.mypackage;

public class JavaApp {


    private static final String MESSAGE = "Hello World Mr. Jenkins !";

    public JavaApp() {}

    public static void main(String[] args) {
        System.out.println(MESSAGE);
    }

    public String getMessage() {
        return MESSAGE;
    }
}
