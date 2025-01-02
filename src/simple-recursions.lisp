;;;; Задачи на программирование рекурсии
;;;; Простая рекурсия

(in-package :lisp-exercises)

;; 1
(defun remove-last (L)
  "Удаляет последний элемент списка"
  (cond
    ((null (cdr L)) nil)
    (t (append
         (cons (car L) nil)
         (remove-last (cdr L))))))

;; 2
(defun one-level-p (L)
  "Определяет, является ли список одноуровневым"
  (cond
    ((atom L) t)
    (t (and
        (atom (car L))
        (one-level-p (cdr L))))))

;; 3
;; (bulb 3 5) => (((5)))
(defun bulb (N A)
  "Возвращает список глубиной N, на дне которого находится A"
  (cond
    ((= N 0) A)
    (t (cons (bulb (- N 1) A) nil))))

;; 4
;; (last-atom '(((5(A))))) => A
(defun last-atom (L)
  "Возвращает последний атом списка (невзирая на скобки)"
  (cond
    ((atom L) L)
    ((null (cdr L)) (last-atom (car L)))
    (t (last-atom (cdr L)))))

;; 5a
(defun delete-first (L X)
  "Удаляет из списка L первое вхождение X на верхнем уровне"
  (cond
    ((null L) nil)
    ((eq (car L) X) (cdr L))
    (t (cons (car L) (delete-first (cdr L) X)))))

;; 5b
(defun delete-all (L X)
  "Удаляет из списка L все вхождения X на верхнем уровне"
  (cond
    ((null L) nil)
    ((eq (car L) X) (delete-all (cdr L) X))
    (t (cons (car L) (delete-all (cdr L) X)))))

;; 6
;; (remove2 '(a b c d e)) => (A C E)
(defun remove2 (L)
  "Удаляет из списка каждый второй элемент верхнего уровня"
  (cond
    ((null L) nil)
    (t (cons (car L) (remove2 (cddr L))))))

;; 7
;; (pair '(a b c d e)) => ((a . b) (c . d) (e))
(defun pair (L)
  "Разбивает список на точечные пары"
  (cond
    ((atom L) L)
    (t (cons
        (cons (car L) (cadr L))
        (pair (cddr L) )))))

;; 8
;; (mix1 '(a b c) '(x y)) => (a x b y c)
(defun mix1 (L1 L2)
  "Образует новый список, чередуя элементы заданных"
  (cond
    ((null L1) L2)
    ((null L2) (cons (car L1) nil))
    (t (append
        (list (car L1) (car L2))
        (mix1 (cdr L1) (cdr L2))))))

;; 9
;; (mix2 '(a b c) '(x y)) => ((a . x)(b . y)(c))
(defun mix2 (L1 L2)
  (cond
    ((null L1) (cons L2 nil))
    ((null L2) (cons (cons (car L1) nil) nil))
    (t (cons
        (cons (car L1) (car L2))
        (mix2 (cdr L1) (cdr L2))))))

;; 10
(defun elem (N L)
  "Возвращает элемент верхнего уровня списка L, стоящий на позиции N"
  (cond
    ((null L) nil)
    ((= N 1) (car L))
    (t (elem (- N 1) (cdr L)))))

;; 11
(defun position-x (X L &optional (N 1))
  "Возвращает порядковый номер значения X (или 0) на верхнем уровне списка L"
  (cond
    ((null L) 0)
    ((equal (car L) X) N)
    (t (position-x X (cdr L) (+ N 1)))))

;; 12
;; (rev-br '(a b c)) => (((c) b) a)
(defun rev-br (L)
  (cond
    ((null (cdr L)) L)
    (t (list (rev-br (cdr L)) (car L)))))

;; 13
;; (right-br '(a b c)) => (a (b (c)))
(defun right-br (L)
  (cond
    ((null (cdr L)) L)
    (t (list (car L) (right-br (cdr L))))))

;; 14
;; (left-br '(a b c)) => (((a) b) c)
(defun left-br (lst)
  (cond
    ((endp (rest lst)) lst)
    (t (list
         (left-br (butlast lst))
         (first (last lst))))))

