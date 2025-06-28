package com.example;


import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest1 {

    private Calculator1 calculator;

    @Before
    public void setUp() {
        calculator = new Calculator1();
        System.out.println("Setup before each test.");
    }

    @After
    public void tearDown() {
        calculator = null;
        System.out.println("Teardown after each test.");
    }

    @Test
    public void testAddition() {
        int a = 5;
        int b = 3;
        int result = calculator.add(a, b);
        assertEquals(8, result);
    }

    @Test
    public void testMultiplication() {
        int a = 4;
        int b = 6;
        int result = calculator.multiply(a, b);
        assertEquals(24, result);
    }
}
