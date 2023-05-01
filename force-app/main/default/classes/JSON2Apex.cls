public class JSON2Apex {

	public class PageInfo {
		public Integer totalResults;
		public Integer resultsPerPage;
	}

	public String kind;
	public String etag;
	public PageInfo pageInfo;
	public List<Items> items;

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

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
}