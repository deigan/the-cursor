◊(define dated (select 'date metas))
◊(define updated (select 'update metas))

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deigan / ◊(select 'title metas)</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Mono" />
<link rel="stylesheet" type="text/css" media="all" href="../../cursor.css" />
</head>



<div class="index-container">
  <div class="index-header">
        <a href="https://mikedeigan.com">Mike&nbsp;Deigan</a>&nbsp;/
        </div>
  <div class="index-main">
        <div id="index-title">◊(select 'title metas) <index-cursor>█</index-cursor></div>
        ◊when/splice[(select 'subtitle metas)]{
                <div class="subtitle index-subtitle">◊(select `subtitle metas)</div>}
       ◊when/splice[dated]{
       <h6 id="post-time">
                posted ◊dated
       <br>
        ◊when/splice[updated]{
                updated ◊updated
                }
       </h6>
                }
        <body>
                <div id="content" align="justified">
                ◊(->html doc #:splice? #t)
                ◊;(map (λ (post) (->html (post-to-index post))) reverse-post-list)
                </div>
                <div class="index-subscribe subscribe">
<form
  action="https://buttondown.email/api/emails/embed-subscribe/the-cursor"
  method="post"
  target="popupwindow"
  onsubmit="window.open('https://buttondown.email/the-cursor', 'popupwindow')"
  class="embeddable-buttondown-form"
>
  <label for="bd-email">Want to get updates about new posts?</label>
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
