#lang pollen
◊(require pollen/pagetree)

◊(define-meta template "index-template.html")
◊(define-meta title "The Cursor")
◊(define-meta subtitle "a philosophy blog")

◊(define pagetree-path
  (build-path (current-project-root) "index.ptree"))

◊(define main-pagetree (get-pagetree pagetree-path))

◊(define post-list (list-tail (pagetree->list main-pagetree) 1))

◊(define reverse-post-list (reverse post-list))

◊(define (post-to-index item)
  `(post (a ((href ,(symbol->string item)))
            ,(select-from-metas 'month-day item)
            ": "
            ,(select-from-metas 'title item))))


◊index-year{2020}

◊(for/splice ([post reverse-post-list]) (post-to-index post))
