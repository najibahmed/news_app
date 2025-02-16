class ApiConstants {
  static String API_KEY = "ea215e91c84e45d89c6a2aeba399c78d";
  static String BASE_URL = "https://newsapi.org/v2/";
  static String TopBusinessHeadlines = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ea215e91c84e45d89c6a2aeba399c78d";
  static String TopBusinessHeadlinesUS = "${BASE_URL}top-headlines?country=us&category=business&apiKey=$API_KEY";
  static String exploreCategory(String category) => "${BASE_URL}everything?q=$category&from=2025-02-14&to=2025-02-14&sortBy=popularity&apiKey=$API_KEY";
  static String TopTechHeadlinesRN = "${BASE_URL}top-headlines?sources=techcrunch&apiKey=$API_KEY";
  static  QueryLastMonthSortedByRecent(String query) => "${BASE_URL}everything?q=${query}&from=2025-01-15&sortBy=publishedAt&apiKey=$API_KEY";
  static  QueryArticleYesterdaySortedPopularPublisher(String query) => "${BASE_URL}everything?q=${query}&from=2025-02-14&to=2025-02-14&sortBy=popularity&apiKey=$API_KEY";

}