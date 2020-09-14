#lang racket/base

(require pollen/core
         pollen/pagetree
         pollen/setup)

(provide (all-defined-out))

(define pagetree-path
  (build-path (current-project-root) "index.ptree"))

(define main-pagetree (get-pagetree pagetree-path))

(define post-list (list-tail (pagetree->list main-pagetree) 1))

(define reverse-post-list (reverse post-list))

(define (post-to-index item)
  `(post (a ((href ,(symbol->string item)))
            ,(select-from-metas 'month-day item)
            ": "
            ,(select-from-metas 'title item))))

