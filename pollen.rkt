#lang pollen/mode racket/base
(require racket/list 
	 racket/string
	 pollen/core 
	 pollen/setup
	 pollen/decode 
	 pollen/tag
         pollen/pagetree
	 pollen/misc/tutorial 
	 txexpr
	 hyphenate
	 ;"search-doc.rkt"
	 describe
         )
(provide (all-defined-out))

(define (root . elements)
  (hyphenate (txexpr 'root empty (decode-elements elements
		     #:txexpr-elements-proc decode-double-breaks-into-paras
		     #:string-proc (compose smart-quotes smart-dashes)
		     		 )
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

(define (emph . elements)
  `(i ,@elements))


(define (term . elements)
  `(i ,@elements))

(define note-sym 11187)
(define note-toggle-sym 11191) 	;⮷ 11191
				;⮳ 11187  
				; 8853  
				;🖙 128409  
				;⇢ 8674


(define (note . text)
    (define refid (number->string (equal-hash-code (car text))))
    `(@ (span [[class "margin-note-indicator"]]  `(sup ,,note-sym))
	    (label [[for ,refid] [class "margin-toggle"]] `(sup ,,note-toggle-sym))
            (input [[type "checkbox"] [id ,refid] [class "margin-toggle"]])
            (span [[class "marginnote"]] ,@text)
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
    [(= (length title) 1) `(h2 ,@title)]
    [start ""]
    [else `(div [[class "intermission"]] "***" )])) ;ellipses 8230

(define (end)
  `(end 9608)) ;█ 9608


(define (index-post date path title)
  `(post (a ((href  ,path)) ,date ": " ,title)))



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



(define pagetree-path
  (build-path (current-project-root) "index.ptree"))

(define main-pagetree (get-pagetree pagetree-path))

(define post-list (list-tail (pagetree->list main-pagetree) 1))

(define reverse-post-list (reverse post-list)) 
