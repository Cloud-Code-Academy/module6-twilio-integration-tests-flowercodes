/**
 * TwilioServiceTest - Test class for TwilioService
 * @see TwilioService
 * 
 * TODO: Implement test methods to verify the functionality of the TwilioService class
 */
@IsTest
private class TwilioServiceTest {
    
    /**
     * Test the sendSMS method with a valid request
     * 
     * TODO: Implement this test method to verify that sending an SMS works correctly
     */
    @IsTest
    static void testSendSMS() {
        // TODO: Setup test data
        // - Create test phone number and message body
        String testToNumber = '+1234567890';
        String testMessageBody = 'Cloud Code Academy is the best!';
        
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate a successful response
        String mockResponseBody = '{"messages":[{"account_sid":"ACba9f06f26134cfca994787e9611854a9","api_version":"2010-04-01","body":"Cloud Code Academy is the best!","date_created":"Sat, 10 May 2025 14:22:27 +0000","date_sent":"Sat, 10 May 2025 14:22:27 +0000","date_updated":"Sat, 10 May 2025 14:22:27 +0000","error_code":null,"error_message":null,"from":"+18776881225","messaging_service_sid":null,"sid":"SM8c5e8fdb4681fa9f9923618fe9412a33","status":"delivered","to":"+18777804236","uri":"/2010-04-01/Accounts/ACba9f06f26134cfca994787e9611854a9/Messages/SM8c5e8fdb4681fa9f9923618fe9412a33.json"}],"uri":"/2010-04-01/Accounts/ACba9f06f26134cfca994787e9611854a9/Messages.json?PageSize=5&Page=0"}';

        TwilioCalloutMock mockResponse = new TwilioCalloutMock(200, mockResponseBody);

        // TODO: Execute the test
        // - Call TwilioService.sendSMS() method
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, mockResponse);
        TwilioResponse response = TwilioService.sendSMS(testToNumber, testMessageBody);
        Test.stopTest();

        
        // TODO: Verify results
        // - Verify that response is successful
        // - Verify status code is correct
        // - Verify response body contains expected values (sid, status, etc.)
        TwilioMessageWrapper parsedMessage = (TwilioMessageWrapper) JSON.deserialize(response.body, TwilioMessageWrapper.class);     
        TwilioMessageWrapper.TwilioMessage individualMessage = parsedMessage.messages[0];

        System.AssertEquals(200, response.statusCode, 'Status code should be 200');
        System.AssertEquals(true, response.success, 'Response should be successful');
        System.AssertEquals('delivered', individualMessage.status, 'Message status should be delivered');
        System.AssertEquals('SM8c5e8fdb4681fa9f9923618fe9412a33', individualMessage.sid, 'Message SID should match');
        System.AssertEquals(testMessageBody, individualMessage.body, 'Message body should match');
    }
    
    /**
     * Test the sendSMS method with an error response
     * 
     * TODO: Implement this test method to verify error handling in sendSMS
     */
    @IsTest
    static void testSendSMSError() {
        // TODO: Setup test data
        // - Create test phone number and message body
        String testToNumber = '+1234567890';
        String testMessageBody = 'Cloud Code Academy is the best!';
        
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate an error response
        string mockErrorResponseBody = '{"messages":[{"account_sid":"ACba9f06f26134cfca994787e9611854a9","api_version":"2010-04-01","body":"error_message","date_created":"Sat, 10 May 2025 14:22:27 +0000","date_sent":"Sat, 10 May 2025 14:22:27 +0000","date_updated":"Sat, 10 May 2025 14:22:27 +0000","error_code":2122,"error_message":"there was an error","from":"+18776881225","messaging_service_sid":null,"sid":"SM8c5e8fdb4681fa9f9923618fe9412a33","status":"delivered","to":"+18777804236","uri":"/2010-04-01/Accounts/ACba9f06f26134cfca994787e9611854a9/Messages/SM8c5e8fdb4681fa9f9923618fe9412a33.json"}],"uri":"/2010-04-01/Accounts/ACba9f06f26134cfca994787e9611854a9/Messages.json?PageSize=5&Page=0"}';

        // TODO: Execute the test
        // - Call TwilioService.sendSMS() method
        Test.startTest();
        TwilioCalloutMock mockResponse = new TwilioCalloutMock(400, mockErrorResponseBody);
        Test.setMock(HttpCalloutMock.class, mockResponse);
        TwilioResponse response = TwilioService.sendSMS(testToNumber, testMessageBody);
        Test.stopTest();
    
        // TODO: Verify results
        // - Verify that response is not successful
        // - Verify error status code is correct
        // - Verify error message is extracted correctly
        TwilioMessageWrapper parsedMessage = (TwilioMessageWrapper) JSON.deserialize(response.body, TwilioMessageWrapper.class);
        TwilioMessageWrapper.TwilioMessage individualMessage = parsedMessage.messages[0];
        System.AssertEquals(400, response.statusCode, 'Status code should be 400');
        System.AssertEquals(false, response.success, 'Response should not be successful');
        System.AssertEquals('there was an error', individualMessage.error_message, 'Error message should match');
        System.AssertEquals('2122', individualMessage.error_code, 'Error code should match');
    }
    
    /**
     * Test the getMessages method
     * 
     * TODO: Implement this test method to verify the getMessages functionality
     */
    @IsTest
    static void testGetMessages() {
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate a successful response with message list
        string mockMessageResponseBody = '{"messages":[{"account_sid":"ACba9f06f26134cfca994787e9611854a9","api_version":"2010-04-01","body":"Cloud Code Academy is the best!","date_created":"Sat, 10 May 2025 14:22:27 +0000","date_sent":"Sat, 10 May 2025 14:22:27 +0000","date_updated":"Sat, 10 May 2025 14:22:27 +0000","error_code":null,"error_message":"","from":"+18776881225","messaging_service_sid":null,"sid":"SM8c5e8fdb4681fa9f9923618fe9412a33","status":"delivered","to":"+18777804236","uri":"/2010-04-01/Accounts/ACba9f06f26134cfca994787e9611854a9/Messages/SM8c5e8fdb4681fa9f9923618fe9412a33.json"}],"uri":"/2010-04-01/Accounts/ACba9f06f26134cfca994787e9611854a9/Messages.json?PageSize=5&Page=0"}';
        
        // TODO: Execute the test
        // - Call TwilioService.getMessages() method with an appropriate limit
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new TwilioCalloutMock(200, mockMessageResponseBody));
        TwilioResponse response = TwilioService.getMessages(5);
        Test.stopTest();
        
        // TODO: Verify results
        // - Verify that response is successful
        // - Verify status code is correct
        // - Verify response body contains expected messages data
        TwilioMessageWrapper parsedMessage = (TwilioMessageWrapper) JSON.deserialize(mockMessageResponseBody, TwilioMessageWrapper.class);
        TwilioMessageWrapper.TwilioMessage individualMessage = parsedMessage.messages[0];
        System.AssertEquals(200, response.statusCode, 'Status code should be 200');
        System.AssertEquals(true, response.success, 'Response should be successful');
        System.AssertEquals('delivered', individualMessage.status, 'Message status should be delivered');
        System.AssertEquals('Cloud Code Academy is the best!', individualMessage.body, 'Message body should match');
    }
    
    /**
     * Test the getMessages method with null/invalid limit
     * 
     * TODO: Implement this test method to verify handling of edge cases
     */
    @IsTest
    static void testGetMessagesWithInvalidLimit() {
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate a successful response
        string mockMessageResponseBody = '{"messages":[{"account_sid":"ACba9f06f26134cfca994787e9611854a9","api_version":"2010-04-01","body":"Cloud Code Academy is the best!","date_created":"Sat, 10 May 2025 14:22:27 +0000","date_sent":"Sat, 10 May 2025 14:22:27 +0000","date_updated":"Sat, 10 May 2025 14:22:27 +0000","error_code":null,"error_message":"","from":"+18776881225","messaging_service_sid":null,"sid":"SM8c5e8fdb4681fa9f9923618fe9412a33","status":"delivered","to":"+18777804236","uri":"/2010-04-01/Accounts/ACba9f06f26134cfca994787e9611854a9/Messages/SM8c5e8fdb4681fa9f9923618fe9412a33.json"}],"uri":"/2010-04-01/Accounts/ACba9f06f26134cfca994787e9611854a9/Messages.json?PageSize=5&Page=0"}';
                
        // TODO: Execute the test with null limit
        // - Call TwilioService.getMessages() method with null
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new TwilioCalloutMock(200, mockMessageResponseBody));
        TwilioResponse response = TwilioService.getMessages(null);
        // TODO: Execute the test with negative limit
        // - Call TwilioService.getMessages() method with a negative number
        TwilioResponse negativeResponse = TwilioService.getMessages(-5);
        Test.stopTest();
        
        // TODO: Verify results
        // - Verify that both responses are successful
        // - Verify that the service handles these edge cases correctly
        TwilioMessageWrapper parsedMessage = (TwilioMessageWrapper) JSON.deserialize(mockMessageResponseBody, TwilioMessageWrapper.class);
        TwilioMessageWrapper.TwilioMessage individualMessage = parsedMessage.messages[0];
        System.AssertEquals(200, response.statusCode, 'Status code should be 200');
        System.AssertEquals(true, response.success, 'Response should be successful');
        System.AssertEquals('delivered', individualMessage.status, 'Message status should be delivered');
        System.AssertEquals(200, negativeResponse.statusCode, 'Status code should be 200');
        System.AssertEquals(true, negativeResponse.success, 'Response should be successful');
        System.AssertEquals('delivered', individualMessage.status, 'Message status should be delivered');
    }
    
    /**
     * Test exception handling in makeHttpRequest
     * 
     * TODO: Implement this test method to verify exception handling
     */
    @IsTest
    static void testMakeHttpRequestException() {
        // TODO: Setup mock that throws exception
        // - Use TwilioCalloutMock.createExceptionMock()
        TwilioCalloutMock mockResponse = TwilioCalloutMock.createExceptionMock();

        // TODO: Execute the test
        // - Call a TwilioService method that will use the mock
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, mockResponse);
        TwilioResponse response = TwilioService.sendSMS('+1234567890', 'Test message');
        Test.stopTest();
        
        // TODO: Verify results
        // - Verify that response indicates failure
        // - Verify that status code is set to 500 (or appropriate error code)
        // - Verify that error message is set correctly
        System.AssertEquals(false, response.success, 'Response should not be successful');
        System.AssertEquals(500, response.statusCode, 'Status code should be 500');
        System.AssertEquals('Simulated exception for testing', response.getErrorMessage(), 'Error message should match');
    }
} 