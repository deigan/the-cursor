<?xml version="1.0" encoding="utf-8"?>
    <feed xmlns="https://www.w3.org/2005/Atom">


        <title>The Cursor</title>
        <subtitle>a philosophy blog</subtitle>
        <link href="◊(pagenode-url here)" rel="self"/>
        <link href="◊|blog-url|"/>
        <updated>◊(post-date-rfc (car reverse-post-list))</updated>
        <author>
          <name>Mike Deigan</name>
        </author>
        <id>◊(uuid here)</id>

        ◊(map (λ (post) 
       (->html       
        `((entry
           "\n\t" (title ,(select-from-metas 'title post))
           "\n\t" (link [[href ,(pagenode-url post)]])
           "\n\t" (id ,(uuid post))
           "\n\t" (updated ,(post-date-rfc post))
           "\n\t" (summary [[type "html"]] ,(select-from-metas 'summary post))
           "\n")
           "\n")))
         reverse-post-list)
   </feed>
        



        
