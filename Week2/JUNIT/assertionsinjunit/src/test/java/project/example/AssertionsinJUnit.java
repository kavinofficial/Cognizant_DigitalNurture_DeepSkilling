package project.example;

import org.junit.Test;
import static org.junit.Assert.*;  

public class AssertionsinJUnit {

    @Test
    public void testAssertions() {
        assertTrue(5 > 3);             
        assertEquals(10, 5 + 5);
        assertFalse(2 > 10);
        assertNull(null);
        assertNotNull(new Object());
    }
}
