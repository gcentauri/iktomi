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
        (:input :type "text" :id "name" :name "name"))
       (:div
        (:label :for "salary")
        (:input :type "number" :id "salary" :name "salary"))
       (:div
        (:label :for "age")
        (:input :type "number" :id "age" :name "age"))
       (:button "submit"))))))

(with-open-file (f "dist/index.html" :direction :output
                                :if-exists :supersede
                                :if-does-not-exist :create)
    (write-sequence (with-html-string (home)) f))

