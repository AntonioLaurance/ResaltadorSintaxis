#lang slideshow
; Resaltador de sintaxis para proyecto

; Integrantes del equipo:
;     Ricardo Campos Luna            A01656898
;     Samuel Sandoval Delgado        A01656191
;     LuisRoberto Martínez Ramírez  A01662619

; Para manejo de archivos HTML
; (require scribble/html/html)
; (require syntax-color/racket-navigation)

; Pedimos archivo del código al usuario
(display "Ruta de archivo (con extensión): ")
(define file (open-input-file (symbol->string (read))))

; Mostramos el objeto 'file' en sí
(display #\newline)
(display file)
(display #\newline)

; Implementación de función que muestra el archivo
(define (print-file char)
    (if (not (eof-object? char))
        (cons char (print-file (read-char file)))
        (begin
          (close-input-port file)        ; Cerramos archivo
          (list))))

; Impresión en HTML
(display-to-file (list (list->string (print-file (read-char file))))
                       "Prueba.html"
                       #:exists 'append)

; (display-lines-to-file (list "Se supone que esto es otra línea") "Prueba.html" #:exists 'append)

; Mostramos código del archivo
(display #\newline)
; (display (list->string (print-file (read-char file))))
(display #\newline)



; Sugerencia armar un diccionario


 
