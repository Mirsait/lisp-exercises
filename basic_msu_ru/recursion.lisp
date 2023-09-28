;;Задачи на программирование рекурсии

;; Простая рекурсия

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
