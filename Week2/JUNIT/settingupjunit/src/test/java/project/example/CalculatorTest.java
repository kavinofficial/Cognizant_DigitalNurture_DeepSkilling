package project.example;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class CalculatorTest {

    @Test
    public void testAddition() {
        int result = 2 + 3;
        System.out.println("testAddition executed.");
        assertEquals(5, result);
    }
}
