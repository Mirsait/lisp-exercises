(defpackage lisp-exercises/tests/simple-recursions
  (:use :common-lisp
        :lisp-exercises
        :rove)
  (:local-nicknames (#:lex :lisp-exercises)))

(in-package :lisp-exercises/tests/simple-recursions)

;; NOTE: To run this test file, execute `(asdf:test-system :lisp-exercises)' in your Lisp.

;; 14
(deftest left-br-test
  (testing "should to be true"
    (ok (equalp
          (lex:left-br '(a b c))
          '(((a) b) c)))))
;; 15
(deftest right-br-out-test-1
  (testing "should to be true"
    (ok (equalp
          (lex:right-br-out '(a (b (c))))
          '(a b c)))))

(deftest right-br-out-test-2
  (testing "should to be true"
    (ok (equalp
          (lex:right-br-out (right-br '(a b c)))
          '(a b c)))))

;; 16
(deftest left-br-out-test-1
  (testing "shold to be true"
    (ok (equalp
          (lex:left-br-out '(((a) b) c))
          '(a b c)))))

(deftest left-br-out-test-2
  (testing "shold to be true"
    (ok (equalp
          (lex:left-br-out (left-br '(a b c)))
          '(a b c)))))
;; 17
(deftest fact*-test
  (testing "shold to be true"
    (ok (equalp
          (lex:fact* 4)
          '(4 * 3 * 2 * 1)))))

