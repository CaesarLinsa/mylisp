;;; -*- Lisp -*-

(defpackage :hello-system (:use #:asdf #:cl))
(in-package :hello-system)

(defsystem hello
  :name "hello world"
  :version "0.1"
  :author "caesar"
  :depends-on ()
  :components ((:file "package")
               (:file "config" :depends-on ("package"))
               (:file "hello"  :depends-on ("config"))))

               
 