import std/httpclient

var client = newHttpClient()
var rss_feed = "https://dateemups.com/feed/"
try:
  echo client.getContent(rss_feed)
finally:
  client.close()
