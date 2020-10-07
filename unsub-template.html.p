◊(define dated (select 'date metas))
◊(define updated (select 'update metas))

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>◊(select 'title metas)</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Mono"/>
<link rel="stylesheet" type="text/css" media="all" href="cursor.css" />
</head>


<div class="container">
  <div class="header">
        <a href="https://mikedeigan.com">Mike Deigan</a> /<br> 
        <a href=◊|blog-url|> ◊|blog|</a> / </div>
  <div class="main">
        <div id="post-title">
                ◊(select 'title metas) <title-cursor>█</title-cursor></div>
        <body>
                <div id="content" align="justified">
                ◊(->html doc #:splice? #t)
                </div>
                

  <div class="navbar">
                ◊when/splice[(and (previous here) (other-siblings here))]{
                       ◊when/splice[(member (previous here) (other-siblings here))]{
                    <span style="float: left"> <a href="../../◊(previous here)">←</a></span>
                }}
                ◊when/splice[(parent here)]{
                <a href="../../◊|(parent here)|">↑</a> 
                }
                ◊when/splice[(next here)]{
                        ◊when/splice[(member (next here) (other-siblings here))]{
                    <span style="float: right"><a href="../../◊|(next here)|">→ </a></span>
                        }
                }
                </div>
               <div class="subscribe">
<form
  action="https://buttondown.email/api/emails/embed-subscribe/the-cursor"
  method="post"
  target="popupwindow"
  onsubmit="window.open('https://buttondown.email/the-cursor', 'popupwindow')"
  class="embeddable-buttondown-form"
>
  <label for="bd-email">But if you want, you can resubscribe:</label>
  <input type="email" name="email" id="bd-email" placeholder="your.name@whatever.com">
  <br>
  <span class="subscribe-buttons">
  <span class="frequency">
  <input type="radio" name="tag" value="Every post" checked>Every post
  </span>
  <span class="frequency">
  <input type="radio" name="tag" value="Monthly">Monthly
  </span>
  <span class="frequency">
  <input type="radio" name="tag" value="Yearly">Yearly
  </span>
  <input type="hidden" value="1" name="embed"/>
  <input type="submit" value="Subscribe" />
  </span>


</form>
                </div>
</body>
  </div>
</div>
</html>
