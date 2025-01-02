(asdf:defsystem "lisp-exercises"
  :version "0.1.0"
  :author "Aucharenka Mikhail"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                 :components
                 ((:file "packages")
                   (:file "simple-recursions"))))
  :description ""
  :long-description #.(read-file-string (subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op "lisp-exercises/tests"))))

(asdf:defsystem "lisp-exercises/tests"
  :version "0.1.0"
  :author "Aucharenka Mikhail"
  :license "MIT"
  :depends-on ("lisp-exercises" "rove")
  :components ((:module "tests"
                 :components
                 ((:file "simple-recursions"))))
  :description "Tests for lisp-exercises")
