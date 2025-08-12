import httpClient, streams
import xmlparser, xmltree
import times

type
  atomChannel = object
    id : string
    title : string
    updated : DateTime
    author : string
    link : string

#   rssChannel = object
#     title : string
#     link : string
#     description : string

proc getXml(): XmlNode =
  var client = newHttpClient()
  var rss_feed = "https://dateemups.com/feed/"
  let xml = client.getContent(rss_feed)
  client.close()
  let xmlStream = newStringStream(xml)
  return parseXml(xmlStream)

proc test(): seq[atomChannel] =
  let xmlRoot = getXml()
  var posts : seq[atomChannel]
  for item_node in xmlRoot.findAll("entry"):
    echo item_node.child("title").innerText
    echo item_node.child("published").innerText
    echo item_node.child("id").innerText
    var post = atomChannel(id: item_node.child("id").innerText, title: item_node.child("title").innerText)
    posts.add(post)
  result = posts

proc main =
  echo test()

when isMainModule:
  main()
