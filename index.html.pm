#lang pollen
◊(require (file "indexing-defs.rkt"))

◊(define-meta template "index-template.html")
◊(define-meta title "The Cursor")
◊(define-meta subtitle "a philosophy blog")

◊index-year{2021}
◊(for/splice ([post (posts-from-year 2021)]) (post-to-index post))
◊index-year{2020}
◊(for/splice ([post (posts-from-year 2020)]) (post-to-index post))
