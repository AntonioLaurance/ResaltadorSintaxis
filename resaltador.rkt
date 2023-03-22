#lang slideshow
; Resaltador de sintaxis para proyecto

; Integrantes del equipo:
;     Ricardo Campos Luna            A01656898
;     Samuel Sandoval Delgado        A01656191
;     Luis Roberto Martínez Ramírez  A01662619

; Pedimos archivo del código al usuario
(display "Ruta de archivo (con extensión): ")
(define file (open-input-file (symbol->string (read))))

; Mostramos el objeto 'file' en sí
(display file)
(display #\newline)

; Implementación de función que muestra el archivo
(define (print-file char)
    (if (not (eof-object? char))
        (cons char (print-file (read-char file)))
        (begin
          (close-input-port file)        ; Cerramos archivo
          (list))))  

; Mostramos código del archivo
(display #\newline)
(display (list->string (print-file (read-char file))))
(display #\newline)

; Impresión en HTML

; Sugerencia armar un diccionario

