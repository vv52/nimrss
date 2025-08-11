import std/httpclient, xmlparser

var client = newHttpClient()
var rss_feed = "https://dateemups.com/feed/"
try:
  let x = parseXml(client.getContent(rss_feed))
  echo $x
finally:
  client.close()
