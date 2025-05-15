public class TwilioMessageWrapper {
    public List<TwilioMessage> messages;
    public String uri;

    public class TwilioMessage {
        public String account_sid;
        public String api_version;
        public String body;
        public String date_created;
        public String date_sent;
        public String date_updated;
        public String error_code;
        public String error_message;
        public String messaging_service_sid;
        public String sid;
        public String status;
        public String to;
        public String uri;
    }
}