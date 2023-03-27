#lang slideshow
; Resaltador de sintaxis para proyecto

; Integrantes del equipo:
;     Ricardo Campos Luna            A01656898
;     Samuel Sandoval Delgado        A01656191
;     LuisRoberto Martínez Ramírez   A01662619

; Para manejo de archivos HTML
; (require scribble/html/html)
; (require syntax-color/racket-navigation)

; Definimos encabezado para archivos HTML
(define headerHTML (list "<!DOCTYPE html>"
        "<html>"
        "<head>"
            "<meta charset=\"UTF-8\">"
            "<!-- white-space: pre modifica el body para que cada linea finalice con <br> (salto de linea), preservando la sintaxis original -->"
            "<!-- CSS verde para los números -->"
            "<!-- CSS morado para los booleanos -->"
            "<!-- CSS verde para los condicionales -->"
            "<!-- CSS rosa para los operadores aritmeticos -->"
            "<!-- CSS negro para los char -->"
            "<!-- CSS verde para los condicionales especiales -->"
            "<style>"
                   "body{ white-space: pre; font-family: Courier New; font-size: 14px }"
                   "h3{ text-align: center }"
                   ".center { display: block; margin-left: auto; margin-right: auto; width: 75px; height: 75px ;}"
                   ".numero{ color: darkseagreen; }"
                   ".booleano{ color: blue; }"
                   ".condicional{ color: purple; }"
                   ".extra{ color: hotpink; }"
                   ".operador{ color: black; }"
                   ".header{ color: green; }"
                   ".string{ color: orange }"
                   ".function{ color: yellow }"
            "</style>"
            "<title>Resaltador de Sintaxis</title>"
        "</head>"
        "<body>"
            "<h3> Resaltador de Sintaxis</h3>"
            "<code>"))


; Definimos el final del archivo HTML
(define finalHTML (list "</code>" "</body>" "</html>"))

; Motor de expresiones regulares
(define (regex listaPy)
  (let regexAhtml 
    ; Definimos un nuevo nombre a la listaPy y una lista final que guardara el sintaxis HTML. La inicializamos vacía.
    ([listaArchEnt listaPy][listaHTML empty])
    ; Preguntamos si la lista de lineas esta vacia
    (if(empty? listaArchEnt)
       ; Si #t quiere decir que ya recorrimos toda la listaPy (listaArchEnt). Regresamos el formato HTML guardado en listaHTML
       listaHTML 
       ; Si #f quiere decir que aun no acabamos y debemos validar la linea siguiente. let* es un operando especial para evaluar condiciones 1 por 1. (los necesarios)
       (let*
           ; Creamos una variable especial para el car de la lista y empezamos el regex y formateo en HTML.
           ([car_de_lista (car listaArchEnt)]
            ; [ car de lista se convertirá en <span> (formato HTML) en caso de encontrar un match con la expresión ]
            ; [ & sustiuye al input en el insert en Racket (regEXP-input-insert) ]
            [car_de_lista (regexp-replace* #px"/\\*[^(\\'*/')]*\\*/" car_de_lista "<span class='header'>&</span>")]
            [car_de_lista (regexp-replace* #px"//[^\n]*" car_de_lista "<span class='header'>&</span>")]
            ;[car_de_lista (regexp-replace* #px"\\(" car_de_lista "<span class='function'>&</span>")]
            [car_de_lista (regexp-replace* #px"for" car_de_lista "<span class='condicional'>&</span>")]
            [car_de_lista (regexp-replace* #px"if" car_de_lista "<span class='condicional'>&</span>")]
            [car_de_lista (regexp-replace* #px"else" car_de_lista "<span class='condicional'>&</span>")]
            [car_de_lista (regexp-replace* #px"while" car_de_lista "<span class='condicional'>&</span>"	)]
            [car_de_lista (regexp-replace* #px"switch" car_de_lista "<span class='condicional'>&</span>")]
            [car_de_lista (regexp-replace* #px"break" car_de_lista "<span class='condicional'>&</span>"	)]
            [car_de_lista (regexp-replace* #px"continue" car_de_lista "<span class='condicional'>&</span>")]
            [car_de_lista (regexp-replace* #px"return" car_de_lista "<span class='condicional'>&</span>")]
            [car_de_lista (regexp-replace* #px"break" car_de_lista "<span class='condicional'>&</span>")]
            [car_de_lista (regexp-replace* #px"bool" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"void" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"short" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"long" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"signed" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"unsigned" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"volatile" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"static" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"enum" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"struct" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"typedef" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"union" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"extern" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"printf" car_de_lista "<span class='function'>&</span>")]
            [car_de_lista (regexp-replace* #px"sizeof" car_de_lista "<span class='function'>&</span>")]
            [car_de_lista (regexp-replace* #px"int" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"float" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"double" car_de_lista "<span class='booleano'>&</span>")]
            ;[car_de_lista (regexp-replace* #px"(\").*\\1" car_de_lista "<span class='string'>&</span>")]
            [car_de_lista (regexp-replace* #px"([\"])(.*)\\1" car_de_lista "<span class='string'>&</span>")]
            [car_de_lista (regexp-replace* #px"#[^ ]*" car_de_lista "<span class='condicional'>&</span>")]
            [car_de_lista (regexp-replace* #px"([+]|[-]|[*])" car_de_lista "<span class='operador'>&</span>")]
            [car_de_lista (regexp-replace* #px"!=" car_de_lista "<span class='operador'>&</span>")]
            [car_de_lista (regexp-replace* #px"==" car_de_lista "<span class='operador'>&</span>")]
            [car_de_lista (regexp-replace* #px"%" car_de_lista "<span class='operador'>&</span>")]
            [car_de_lista (regexp-replace* #px"[(]|[)]" car_de_lista "<span class='operador'>&</span>")]
            [car_de_lista (regexp-replace* #px"<=" car_de_lista "<span class='operador'>&</span>")]
            [car_de_lista (regexp-replace* #px"(None|none)" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"true" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"false" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"char" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"const" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"auto" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"static" car_de_lista "<span class=''booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"and" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"not" car_de_lista "<span class='booleano'>&</span>")]
            [car_de_lista (regexp-replace* #px"[0-9]+" car_de_lista "<span class='numero'>&</span>")])
         ; Apendizamos los formatos HTML e iteramos para el resto de la lista
         (regexAhtml (cdr listaArchEnt) (append listaHTML (list car_de_lista)))))))
        ;pasamos como nueva lista el cdr de listaArchEnt y apendizamos a la lista final el nuevo car dado por regex-replace*


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

; Función que convierte los carácteres especiales "<" y ">" para que sean
; exitosamente leídos por el navegador
(define (process-text char-list)
  (if (empty? char-list)
      (list)
      (if (equal? (list-ref char-list 0) #\<)      ; Remplazamos "<" por "&lt;"
            (append '(#\& #\l #\t #\;) (process-text (cdr char-list)))
            (if (equal? (list-ref char-list 0) #\>)  ; Remplazamos ">" por "&gt;"
                (append '(#\& #\g #\t #\;) (process-text (cdr char-list)))
                (append (list (car char-list)) (process-text (cdr char-list)))))))                              


; Impresión en HTML
(display-lines-to-file (append headerHTML (regex (list (list->string (process-text list-char-file)))) finalHTML)
                      "Prueba.html"
                      #:exists 'replace)

; Sugerencia armar un diccionario