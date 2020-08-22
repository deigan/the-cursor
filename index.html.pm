#lang pollen
◊(require (file "indexing-defs.rkt"))

◊(define-meta template "index-template.html")
◊(define-meta title "The Cursor")
◊(define-meta subtitle "a philosophy blog")

◊index-year{2020}

◊(for/splice ([post reverse-post-list]) (post-to-index post))
