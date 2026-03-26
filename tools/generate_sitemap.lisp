(defun generate-sitemap ()
  (let* ((dir "public/")
         (files (directory (merge-pathnames "*.html" dir)))
         (output (merge-pathnames "sitemap.xml" dir)))
    (with-open-file (out output
                         :direction :output
                         :if-exists :supersede)
      (format out "<?xml version=\"1.0\" encoding=\"UTF-8\"?>~%")
      (format out "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">~%")
      (dolist (f files)
        (let ((name (file-namestring f)))
          (format out "  <url><loc>https://example.com/~a</loc></url>~%" name)))
      (format out "</urlset>~%")))
  (format t "✔ sitemap.xml généré dans /public/~%"))

(generate-sitemap)
