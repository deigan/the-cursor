#lang pollen/mode racket/base
(require racket/list 
	 racket/string
	 pollen/core 
	 pollen/setup
	 pollen/decode 
	 pollen/tag
         pollen/pagetree
	 pollen/misc/tutorial
         pollen/template/html
	 txexpr
	 hyphenate
	 ;"search-doc.rkt"
	 describe
         )
(provide (all-defined-out))

(define (root . elements)
    (txexpr 'root empty (decode-elements elements
		     #:txexpr-elements-proc decode-double-breaks-into-paras
		     #:string-proc (compose hyphenate smart-quotes smart-dashes)
		     #:exclude-tags '(script)
		     		 )
		)
)

(define (decode-double-breaks-into-paras elements)
  (decode-paragraphs elements
                     #:linebreak-proc (λ (x) (decode-linebreaks x '" "))))


(define blog
  "The Cursor")

(define website-url
  "https://mikedeigan.com/")

(define blog-url
  "https://mikedeigan.com/the-cursor/")

(define (lead-in . elements)
  `(span [[class "lead-in"]] ,@elements))

(define (sc . elements)
  `(span [[style "font-variant: small-caps"]] ,@elements))

(define (emph . elements)
  `(i ,@elements))


(define (term . elements)
  `(i ,@elements))

(define ns
  `(svg [
	 [viewBox "0 50 250 450"]
	 [width ".8rem"]
	 [style "vertical-align: baseline;
		position: relative;
		top: -0.2rem"]]
  (path  [[x "0"]
	  [y "0"]
	  [preserveAspectRatio "xMidYMin meet"] 
	  [d "M229.2188 262.4062 L140.7656 350.8594 L140.7656 304.0312 L104.3438 304.0312 L104.3438 427.2188 L62.7188 385.5938 L21.0938 427.2188 L21.0938 352.8281 Q21.0938 327.375 25.6562 316.2031 Q30.2344 305.0156 48.0938 287.1562 L92.8125 242.4375 Q104.625 230.625 112.2188 226.4062 Q122.3438 220.7812 136.5469 220.7812 L140.7656 220.7812 L140.7656 173.9531 L229.2188 262.4062 ZM208.8281 262.4062 L154.6875 208.125 L154.6875 234.7031 L140.7656 234.7031 Q120.6562 234.7031 107.7188 247.6406 L65.3906 290.1094 L154.6875 290.1094 L154.6875 316.6875 L208.8281 262.4062 ZM90.4219 394.3125 L90.4219 304.0312 L79.3125 304.0312 Q56.25 304.0312 46.4062 311.3438 Q34.875 319.9219 34.875 342 L34.875 394.3125 L62.7188 366.4688 L90.4219 394.3125 Z"]])
		   )
)

(define ins
  `(svg [
	 [viewBox "0 50 250 450"]
	 [width ".8rem"]
	 [style "vertical-align: baseline;
		position: relative;
		top: 0.2rem"]]
  (path  [[x "0"]
	  [y "0"]
	  [preserveAspectRatio "xMidYMin meet"] 
	  [d "M229.2188 304.0312 L140.7656 392.4844 L140.7656 345.6562 L136.5469 345.6562 Q122.3438 345.6562 112.2188 340.0312 Q104.625 335.8125 92.8125 324 L48.0938 279.2812 Q30.2344 261.4219 25.6562 250.25 Q21.0938 239.0625 21.0938 213.6094 L21.0938 139.2188 L62.7188 180.8438 L104.3438 139.2188 L104.3438 262.4062 L140.7656 262.4062 L140.7656 215.5781 L229.2188 304.0312 ZM90.4219 262.4062 L90.4219 172.125 L62.7188 199.9688 L34.875 172.125 L34.875 224.4375 Q34.875 246.5156 46.4062 255.0938 Q56.25 262.4062 79.3125 262.4062 L90.4219 262.4062 ZM208.8281 304.0312 L154.6875 249.75 L154.6875 276.3281 L65.3906 276.3281 L107.7188 318.7969 Q120.6562 331.7344 140.7656 331.7344 L154.6875 331.7344 L154.6875 358.3125 L208.8281 304.0312 Z"]
	  ])

  )
)

(define nts
  `(svg [
	 [viewBox "0 50 250 450"]
	 [width ".8rem"]
	 [style "vertical-align: baseline;
		position: relative;
		top: -0.05rem;
		left: -0.3rem"]]
  (path  [[x "0"]
	  [y "0"]
	  [fill "red"]
	  [preserveAspectRatio "xMidYMin meet"] 
	  [d "M274.3594 298.8281 L185.9062 387.2812 L97.4531 298.8281 L144.2812 298.8281 L144.2812 262.4062 L21.0938 262.4062 L62.7188 220.7812 L21.0938 179.1562 L95.4844 179.1562 Q120.9375 179.1562 132.1094 183.7344 Q143.2969 188.2969 161.1562 206.1562 L205.875 250.875 Q217.6875 262.6875 221.9062 270.2812 Q227.5312 280.4062 227.5312 294.6094 L227.5312 298.8281 L274.3594 298.8281 ZM240.1875 312.75 L213.6094 312.75 L213.6094 298.8281 Q213.6094 278.7188 200.6719 265.7812 L158.2031 223.4531 L158.2031 312.75 L131.625 312.75 L185.9062 366.8906 L240.1875 312.75 ZM144.2812 248.4844 L144.2812 237.375 Q144.2812 214.3125 136.9688 204.4688 Q128.3906 192.9375 106.3125 192.9375 L54 192.9375 L81.8438 220.7812 L54 248.4844 L144.2812 248.4844 Z"]
	  ])

  )
)
  

(define note-sym 11187)
(define in-note-sym 11185)
(define note-toggle-sym 11191)  ;⮷ 11191
				;⮳ 11187  
				;⮰ 11184
				;⮱ 11185
				;➩
				;➪ 10154
				; 8853  
				;🖙 128409  
				;⇢ 8674
				;⇨ 8680


(define (note . text)
    (define refid (number->string (equal-hash-code (car text))))
    ;`(@ (span [[class "margin-note-indicator"]]  `(sup ,,note-sym))
    `(@ (span [[class "margin-note-indicator"]]  ,ns)
	    ;(label [[for ,refid] [class "margin-toggle"]] `(sup ,,note-toggle-sym))
	    (label [[for ,refid] [class "margin-toggle"]] ,nts)
            (input [[type "checkbox"] [id ,refid] [class "margin-toggle"]])
            (span [[class "marginnote"]]
		  ;(sup [[class "marginlabel"]] ,in-note-sym) 
		  ,ins
 ,@text)
     )
)

(define (link url #:ext [external #f] . contents)
  (define attrs (if external
		`((href ,url) (target "_blank") (rel "noopener") (class "external"))
        	`((href ,url))))
  (if (empty? contents)
    `(a ,attrs ,url)
    `(a ,attrs ,@contents)))


(define (section #:at-start [start #f] . title)
  (cond
    [(= (length title) 1) `(h4 ,@title)]
    [start ""]
    [else `(div [[class "intermission"]] "***" )])) ;ellipses 8230

(define (end)
  `(end 9608)) ;█ 9608





; Functions for Atom feed
; 	from http://blevs.github.io/pollen-feed-tutorial/

(define (pagenode-url pagenode)
  (format "~a~a" blog-url pagenode))

(define (post-date-rfc post)
  (select-from-metas 'feed-date post))

(define (uuid post)
  (string-append "urn:uuid:" (select-from-metas 'uuid post)))

;(define (feed-summary post)
;  (search-doc post (λ (x) (equal? 'p (get-tag x)))))



;(define pagetree-path
;  (build-path (current-project-root) "index.ptree"))
;
;(define main-pagetree (get-pagetree pagetree-path))
;
;(define post-list (list-tail (pagetree->list main-pagetree) 1))
;
;(define reverse-post-list (reverse post-list))
;
;
;(define (index-post date path title)
;  `(post (a ((href  ,path)) ,date ": " ,title)))
;
;(define (post-to-index item)
;  `(post (a ((href ,(symbol->string item)))
;            ,(select-from-metas 'month-day item)
;            ": "
;            ,(select-from-metas 'title item))))

(define (posts-from-dir dir)
  (map (λ (p) (string-trim p ".pm"))
       (filter (λ (p)(string-suffix? p ".pm"))
	       (map (λ (p) (path->string p)) (directory-list #:build? #t dir)))))

(define (date-sort posts)
  (sort posts #:key post-date-rfc string<?))


;(define 2020-ptree-list
;  (date-sort (posts-from-dir "posts/2020")))
