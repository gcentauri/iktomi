(in-package :spinneret)

(defun home ()
  (with-html
    (:doctype)
    (:html
     (:head
      (:title "Home page"))
     (:body
      (:header
       (:h1 "Home page"))
      (:form
       :action "my-form" :method "post"
       (:div
        (:label :for "name")
        (:input :type "text" :id "name" :name "user_name")))))))

(with-open-file (f "dist/index.html" :direction :output
                                :if-exists :supersede
                                :if-does-not-exist :create)
    (write-sequence (with-html-string (home)) f))

