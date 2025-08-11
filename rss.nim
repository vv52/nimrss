import std/httpclient, xmlparser, xmltree

var client = newHttpClient()
var rss_feed = "https://dateemups.com/feed/"
try:
  let x = parseXml(client.getContent(rss_feed))
  for element in x:
    echo element
finally:
  client.close()
