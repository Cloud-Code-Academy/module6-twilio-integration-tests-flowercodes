/**
 * TwilioRestApiTest - Test class for TwilioRestApi
 * @see TwilioRestApi
 * 
 * TODO: Implement test methods to verify the functionality of the TwilioRestApi class
 */
@IsTest
private class TwilioRestApiTest {
    
    /**
     * Test handleIncomingSMS method with standard SMS parameters
     * 
     * TODO: Implement this test method to verify handling of standard SMS webhooks
     */
    @IsTest
    static void testHandleIncomingSMSStandard() {
        // TODO: Setup mock REST request with standard SMS parameters
        // - Create RestRequest and RestResponse objects
        // - Set requestURI (e.g., '/services/apexrest/twilio/sms')
        // - Set httpMethod to 'POST'
        // - Add required parameters (MessageSid, AccountSid, From, To, Body, etc.)
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';
        req.params.put('MessageSid', 'SM1234567890abcdef');
        req.params.put('AccountSid', 'AC1234567890abcdef');
        req.params.put('From', '+15551234567');
        req.params.put('To', '+15559876543');
        req.params.put('Body', 'Hello, this is a test message!');
        
        // TODO: Set the mock request/response objects in RestContext
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        
        // TODO: Execute the test
        // - Call TwilioRestApi.handleIncomingSMS()
        Test.startTest();
        String response = TwilioRestApi.handleIncomingSMS();
        Test.stopTest();
        
        // TODO: Verify results
        // - Verify response XML is not null
        // - Verify response contains expected TwiML elements
        System.assertNotEquals(null, response, 'Response should not be null');   
        System.assertEquals(true, response.contains('<Response>'), 'Response should contain TwiML <Response> element');
    }
    
    /**
     * Test handleIncomingSMS method with media attachments
     * 
     * TODO: Implement this test method to verify handling of SMS with media
     */
    @IsTest
    static void testHandleIncomingSMSWithMedia() {
        // TODO: Setup mock REST request with media parameters
        // - Create RestRequest and RestResponse objects
        // - Set requestURI and httpMethod
        // - Add required parameters
        // - Add media attachment parameters (NumMedia, MediaUrl0, MediaContentType0, etc.)
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';
        req.params.put('MessageSid', 'SM1234567890abcdef');
        req.params.put('AccountSid', 'AC1234567890abcdef');
        req.params.put('From', '+15551234567');
        req.params.put('To', '+15559876543');
        req.params.put('Body', 'Hello, this is a test message with media!');
        req.params.put('NumMedia', '1');
        req.params.put('MediaUrl0', 'http://example.com/media1.jpg');
        req.params.put('MediaContentType0', 'image/jpeg');
        
        // TODO: Set the mock request/response objects in RestContext
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // TODO: Execute the test
        // - Call TwilioRestApi.handleIncomingSMS()
        Test.startTest();
        String response = TwilioRestApi.handleIncomingSMS();
        Test.stopTest();
        
        // TODO: Verify results
        // - Verify response XML is not null
        // - Verify response contains expected TwiML elements
        System.assertNotEquals(null, response, 'Response should not be null');
        System.assertEquals('<?xml version="1.0" encoding="UTF-8"?><Response></Response>', response, 'Response should contain TwiML <Response> element');
    }
    
    /**
     * Test handleIncomingSMS method with location data
     * 
     * TODO: Implement this test method to verify handling of SMS with location data
     */
    @IsTest
    static void testHandleIncomingSMSWithLocation() {
        // TODO: Setup mock REST request with location parameters
        // - Create RestRequest and RestResponse objects
        // - Set requestURI and httpMethod
        // - Add required parameters
        // - Add location parameters (FromCity, FromState, FromZip, FromCountry, etc.)
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';
        req.params.put('MessageSid', 'SM1234567890abcdef');
        req.params.put('AccountSid', 'AC1234567890abcdef');
        req.params.put('From', '+15551234567');
        req.params.put('To', '+15559876543');
        req.params.put('Body', 'Hello, this is a test message with location!');
        req.params.put('FromCity', 'San Francisco');
        req.params.put('FromState', 'CA');
        req.params.put('FromZip', '94105');
        req.params.put('FromCountry', 'US');
        req.params.put('ToCity', 'Los Angeles');
        req.params.put('ToState', 'CA');
        req.params.put('ToZip', '90001');
        req.params.put('ToCountry', 'US');
        
        
        // TODO: Set the mock request/response objects in RestContext
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // TODO: Execute the test
        // - Call TwilioRestApi.handleIncomingSMS()
        Test.startTest();
        String response = TwilioRestApi.handleIncomingSMS();
        Test.stopTest();
        
        // TODO: Verify results
        // - Verify response XML is not null
        // - Verify response contains expected TwiML elements
        System.assertNotEquals(null, response, 'Response should not be null');
        System.assertEquals('<?xml version="1.0" encoding="UTF-8"?><Response></Response>', response, 'Response should contain TwiML <Response> element');
    }
    
    /**
     * Test handleIncomingSMS method with WhatsApp parameters
     * 
     * TODO: Implement this test method to verify handling of WhatsApp messages
     */
    @IsTest
    static void testHandleIncomingSMSWithWhatsApp() {
        // TODO: Setup mock REST request with WhatsApp parameters
        // - Create RestRequest and RestResponse objects
        // - Set requestURI and httpMethod
        // - Add required parameters with WhatsApp format (e.g., From: 'whatsapp:+15551234567')
        // - Add WhatsApp specific parameters (ProfileName, WaId, etc.)
        // - Add WhatsApp location data if applicable
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';
        req.params.put('MessageSid', 'SM1234567890abcdef');
        req.params.put('AccountSid', 'AC1234567890abcdef');
        req.params.put('From', 'whatsapp:+15551234567');
        req.params.put('To', 'whatsapp:+15559876543');
        req.params.put('Body', 'Hello, this is a test WhatsApp message!');
        req.params.put('ProfileName', 'Test Profile');
        req.params.put('WaId', '1234567890');
        
        // TODO: Set the mock request/response objects in RestContext
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // TODO: Execute the test
        // - Call TwilioRestApi.handleIncomingSMS()
        Test.startTest();
        String response = TwilioRestApi.handleIncomingSMS();
        Test.stopTest();
        
        // TODO: Verify results
        // - Verify response XML is not null
        // - Verify response contains expected TwiML elements
        System.assertNotEquals(null, response, 'Response should not be null');
        System.assertEquals('<?xml version="1.0" encoding="UTF-8"?><Response></Response>', response, 'Response should contain TwiML <Response> element');
    }
} 