public class youtubeIntegration {
    public static void callHttp(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://youtube.googleapis.com/youtube/v3/channels?part=statistics&id=UCZTQPv1TB9haXtPAdCsTIJw&key=AIzaSyDDVenRdNTnEMF_tJ_A8niErEZtNNvJM_I');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        system.debug(res.getBody());
        abcd ab = new abcd();
        ab=(abcd)JSON.deserialize(res.getBody(), abcd.class);
        system.debug('Id--->'+ab.items[0].id);
    }
    public class PageInfo {
        public Integer totalResults;
        public Integer resultsPerPage;
    }
    public class abcd{
        public String kind;
        public String etag;
        public PageInfo pageInfo;
        public List<Items> items;
    }
    
    
    public class Items {
        public String kind;
        public String etag;
        public String id;
        public Statistics statistics;
    }
    
    public class Statistics {
        public String viewCount;
        public String subscriberCount;
        public Boolean hiddenSubscriberCount;
        public String videoCount;
    }
    
}