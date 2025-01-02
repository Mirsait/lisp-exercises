(defpackage lisp-exercises/tests/simple-recursions
  (:use :common-lisp
        :lisp-exercises
        :rove))
(in-package :lisp-exercises/tests/simple-recursions)

;; NOTE: To run this test file, execute `(asdf:test-system :lisp-exercises)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))

;; 14
(deftest left-br-test
  (testing "should to be true"
    (ok (equalp
          (left-br '(a b c))
          '(((a) b) c)))))
;; 15
(deftest right-br-out-test-1
  (testing "should to be true"
    (ok (equalp
          (right-br-out '(a (b (c))))
          '(a b c)))))

(deftest right-br-out-test-2
  (testing "should to be true"
    (ok (equalp
          (right-br-out (right-br '(a b c)))
          '(a b c)))))


