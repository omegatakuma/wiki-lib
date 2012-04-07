(define-module libr.wiki
			   (use srfi-1)
			   (use util.list)
			   (use rfc.http)
			   (use sxml.ssax)
			   (use sxml.sxpath)
			   (use rfc.uri)
			   (export wiki-get))
(select-module libr.wiki)

(define uri "wikipedia.simpleapi.net")
(define (result-get word)
  (receive (status head body)
		   (http-get uri (string-append "/api?keyword=" word))
		   (ssax:xml->sxml (open-input-string body) '())))
(define (wiki-get word . opt)
  (let1 result (result-get (result-get (uri-encode-string word)))
		(cond
		  ((equal? (car opt) "title")((sxpath "/results/result/title/text()") result))
		  ((equal? (car opt) "body")((sxpath "/results/result/body/text()") result))
		  ((equal? (car opt) "id")((sxpath "/results/result/id/text()") result))
		  ((equal? (car opt) "url")((sxpath "/results/result/url/text()") result))
		  (else (let ((title (sxpath "/results/result/title/text()") result)
					  (body (sxpath "/results/result/body/text()") result))
				  (zip title body))))))
(provide "libr/wiki")
