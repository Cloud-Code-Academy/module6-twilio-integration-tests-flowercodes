/**
 * TwilioCalloutMock - Mock implementation for Twilio API callouts
 * Used in test classes to simulate HTTP responses from Twilio
 * 
 * TODO: Implement this mock class to simulate Twilio API responses for testing
 */
@IsTest
public class TwilioCalloutMock implements HttpCalloutMock {
    private Integer statusCode;
    private String responseBody;
    private Boolean throwException;
    private String exceptionMessage;
    
    /**
     * Constructor to initialize with specific status code and response body
     * @param statusCode HTTP status code to return
     * @param responseBody JSON body to return
     */
    public TwilioCalloutMock(Integer statusCode, String responseBody) {
        // TODO: Initialize the mock with the provided status code and response body
        this.statusCode = statusCode;
        this.responseBody = responseBody;
    }
    
    /**
     * Constructor to create a mock that throws an exception
     * @param exceptionMessage The exception message to throw
     */
    public TwilioCalloutMock(String exceptionMessage) {
        // TODO: Initialize the mock to throw an exception with the given message
        this.throwException = true;
        this.exceptionMessage = exceptionMessage;
    }
    
    /**
     * Creates an exception-throwing mock with default message
     * @return TwilioCalloutMock An instance that will throw an exception
     */
    public static TwilioCalloutMock createExceptionMock() {
        // TODO: Return a new instance that will throw an exception with a default message
        return new TwilioCalloutMock('Simulated exception for testing');
    }
    
    /**
     * Implementation of the HttpCalloutMock interface
     * @param request The HttpRequest being processed
     * @return HttpResponse A predefined response with the configured status code and body
     * @throws CalloutException If this mock is configured to throw an exception
     */
    public HttpResponse respond(HttpRequest request) {
        // TODO: Implement the response logic based on the configuration
        // If throwException is true, throw a CalloutException
        // Otherwise, create and return an HttpResponse with the appropriate status code and body
        if(throwException == true){
            throw new CalloutException(exceptionMessage);
        }
        else{
            HttpResponse response = new HttpResponse();
            response.setStatusCode(statusCode);
            response.setBody(responseBody);
            return response;
        }
    }
} 