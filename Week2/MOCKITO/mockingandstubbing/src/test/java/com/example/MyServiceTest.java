package com.example;

import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class MyServiceTest {

    @Test
    public void testExternalApi() {
        // Arrange - Create mock and stub method
        ExternalApi mockApi = mock(ExternalApi.class);
        when(mockApi.getData()).thenReturn("Mock Data");

        // Act - Inject mock into service and call method
        MyService service = new MyService(mockApi);
        String result = service.fetchData();

        // Assert - Verify the result
        assertEquals("Mock Data", result);
    }
}
