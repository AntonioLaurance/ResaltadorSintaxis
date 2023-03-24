#lang slideshow
; Resaltador de sintaxis para proyecto

; Integrantes del equipo:
;     Ricardo Campos Luna            A01656898
;     Samuel Sandoval Delgado        A01656191
;     LuisRoberto Martínez Ramírez  A01662619

; Para manejo de archivos HTML
; (require scribble/html/html)
; (require syntax-color/racket-navigation)

; Definimos encabezado para archivos HTML
(define headerHTML(list "<!DOCTYPE html>"
        "<html>"
        "<head>"
            "<meta charset=\"UTF-8\">"
            "<!-- white-space: pre modifica el body para que cada linea finalice con <br> (salto de linea), preservando la sintaxis original -->"
            "<!-- CSS naranja para los números -->"
            "<!-- CSS morado para los booleanos -->"
            "<!-- CSS verde para los condicionales -->"
            "<!-- CSS rosa para los operadores aritmeticos -->"
            "<!-- CSS negro para los char -->"
            "<!-- CSS verde para los condicionales especiales -->"
            "<style>"
                   "body{ white-space: pre; font-family: Courier New; font-size: 14px }"
                   "h3{ text-align: center }"
                   ".center { display: block; margin-left: auto; margin-right: auto; width: 75px; height: 75px ;}"
                   ".numero{ color: orange; }"
                   ".booleano{ color: purple; }"
                   ".condicional{ color: green; }"
                   ".extra{ color: hotpink; }"
                   ".operador{ color: black; }"
                   ".header{ color: YellowGreen; }"
            "</style>"
            "<title>Resaltador de Sintaxis</title>"
        "</head>"
        "<body>"
            "<h3> Resaltador de Sintaxis</h3>"
            "<br>"))


; Definimos el final del archivo HTML
(define finalHTML (list "</body>" "</html>"))

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

; Guardamos el código del archivo en una lista de carácteres
(define list-char-file (print-file (read-char file)))

; Mostramos código del archivo
(display #\newline)
(display (list->string list-char-file))
(display #\newline)

; Impresión en HTML
(display-lines-to-file (append headerHTML (list (list->string list-char-file)) finalHTML)
                      "Prueba.html"
                      #:exists 'replace)

; Sugerencia armar un diccionario


 
