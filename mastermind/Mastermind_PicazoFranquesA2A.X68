*-----------------------------------------------------------
* Title      :  MASTERMIND
* Written by :  PASTOR PICAZO, EDUARDO
*               FRANQUES GARCIA, ANTONIO MARIA
*-----------------------------------------------------------    
        ORG	$1000

*****************************DEFINICIÓN DE CONSTANTES*****************************
*Colores
NEGRO		        EQU	    $00000000
AZUL		        EQU	    $00FF0000
VERDE		        EQU	    $0000FF00
MARRON		        EQU	    $00000080
ROJO	            EQU	    $000000FF
BLANCO		        EQU	    $00FFFFFF
AMARILLO	        EQU	    $0000FFFF
GRIS		        EQU	    $00808080
LILA		        EQU	    $00800080

*Popup propiedades: (Pop-up = Ventana Emergente).
*En el popup se pide el número de bolas por turno, número de turnos por partida
*y si permitimos colores repetidos en la combinación.
Popup_Anchura		EQU		500
Popup_Altura		EQU		400
Popup_Arriba        EQU     40
Popup_Izq           EQU     50
Popup_Abajo         EQU     Popup_Arriba+Popup_Altura
Popup_Der           EQU     Popup_Izq+Popup_Anchura

Popup_txt_Altura    EQU     30                                      ;Distancia entre el borde superior del mensaje y el del botón correspondiente a ese mensaje. 
Popup_txt_Izq       EQU     Popup_Izq+30                            ;Margen izquierdo entre el borde del Pop-up y el comienzo del mensaje.
Popup_txt_Separa    EQU     50                                      ;Distancia entre el borde superior de un mensaje con el del siguiente mensaje.

Popup_Boton_Altura	EQU		20                                      ;Altura y a continuación anchura del botón que se usará para contestar al mensaje.
Popup_Boton_Anchura	EQU		40
Popup_Boton_GapX    EQU		5                                       ;Hueco eje X entre dichos botones.

Popup_txt1_Arriba   EQU     Popup_Arriba+50                         ;Posiciones del borde superior, inferior e izquierdo de la primera frase del popup
Popup_txt1_Abajo    EQU     Popup_txt1_Arriba+Popup_txt_Altura
Popup_txt1_Izq      EQU     Popup_txt_Izq
Popup_txt1_GapX     EQU     15                                      ;Huecos eje X e Y entre el borde del botón y el inicio del texto que tiene dentro (correspondientes al primer mensaje).
Popup_txt1_GapY     EQU     3                                       
Popup_B_txt1_Arriba EQU     Popup_txt1_Abajo                        ;Posiciones del borde superior e inferior de los botones correspondientes al primer mensaje. 
Popup_B_txt1_Abajo  EQU     Popup_B_txt1_Arriba+Popup_Boton_Altura

Cuatro_Boton_Izq	EQU		Popup_txt_Izq                           ;Posiciones del borde izquierdo y derecho del primer botón del primer mensaje
Cuatro_Boton_der	EQU		Cuatro_Boton_Izq+Popup_Boton_Anchura
Cuatro_txt_Arriba   EQU     Popup_B_txt1_Arriba+Popup_txt1_GapY     ;Posición Y y X del inicio del texto contenido en el primer botón del primer mensaje.
Cuatro_txt_Izq	    EQU		Cuatro_Boton_Izq+Popup_txt1_GapX

Cinco_Boton_Izq	    EQU		Cuatro_Boton_der+Popup_Boton_GapX       ;Posiciones del borde izquierdo y derecho del segundo botón del primer mensaje
Cinco_Boton_der	    EQU		Cinco_Boton_Izq+Popup_Boton_Anchura
Cinco_txt_Arriba    EQU     Popup_B_txt1_Arriba+Popup_txt1_GapY     ;Posición Y y X del inicio del texto contenido en el segundo botón del primer mensaje.
Cinco_txt_Izq	    EQU		Cinco_Boton_Izq+Popup_txt1_GapX

Seis_Boton_Izq	    EQU		Cinco_Boton_der+Popup_Boton_GapX        ;Posiciones del borde izquierdo y derecho del tercer botón del primer mensaje
Seis_Boton_der	    EQU		Seis_Boton_Izq+Popup_Boton_Anchura
Seis_txt_Arriba     EQU     Popup_B_txt1_Arriba+Popup_txt1_GapY     ;Posición Y y X del inicio del texto contenido en el tercer botón del primer mensaje.
Seis_txt_Izq	    EQU		Seis_Boton_Izq+Popup_txt1_GapX          

Popup_txt2_Arriba   EQU     Popup_B_txt1_Abajo+Popup_txt_Separa     ;Posiciones del borde superior, inferior e izquierdo de la segunda frase del popup  
Popup_txt2_Abajo    EQU     Popup_txt2_Arriba+Popup_txt_Altura
Popup_txt2_Izq      EQU     Popup_txt_Izq
Popup_txt2_GapX     EQU     15                                      ;Huecos eje X e Y entre el borde del botón y el inicio del texto que tiene dentro (correspondientes al segundo mensaje).
Popup_txt2_GapY     EQU     3                                      
Popup_B_txt2_Arriba EQU     Popup_txt2_Abajo                        ;Posiciones del borde superior e inferior de los botones correspondientes al segundo mensaje. 
Popup_B_txt2_Abajo  EQU     Popup_B_txt2_Arriba+Popup_Boton_Altura  

Doce_Boton_Izq	    EQU		Popup_txt_Izq                           ;Posiciones del borde izquierdo y derecho del primer botón del segundo mensaje
Doce_Boton_der	    EQU		Doce_Boton_Izq+Popup_Boton_Anchura
Doce_txt_Arriba     EQU     Popup_B_txt2_Arriba+Popup_txt2_GapY     ;Posición Y y X del inicio del texto contenido en el primer botón del segundo mensaje.
Doce_txt_Izq	    EQU		Doce_Boton_Izq+Popup_txt2_GapX

Dieci_Boton_Izq	    EQU		Doce_Boton_der+Popup_Boton_GapX         ;Posiciones del borde izquierdo y derecho del segundo botón del segundo mensaje 
Dieci_Boton_der	    EQU		Dieci_Boton_Izq+Popup_Boton_Anchura
Dieci_txt_Arriba    EQU     Popup_B_txt2_Arriba+Popup_txt2_GapY     ;Posición Y y X del inicio del texto contenido en el segundo botón del segundo mensaje.
Dieci_txt_Izq	    EQU		Dieci_Boton_Izq+Popup_txt2_GapX

Popup_txt3_Arriba   EQU     Popup_B_txt2_Abajo+Popup_txt_Separa     ;Posiciones del borde superior, inferior e izquierdo de la tercera frase del popup
Popup_txt3_Abajo    EQU     Popup_txt3_Arriba+Popup_txt_Altura
Popup_txt3_Izq      EQU     Popup_txt_Izq
Popup_txt3_GapX     EQU     15                                      ;Huecos eje X e Y entre el borde del botón y el inicio del texto que tiene dentro (correspondientes al tercer mensaje).
Popup_txt3_GapY     EQU     3                                      
Popup_B_txt3_Arriba EQU     Popup_txt3_Abajo                        ;Posiciones del borde superior e inferior de los botones correspondientes al tercer mensaje 
Popup_B_txt3_Abajo  EQU     Popup_B_txt3_Arriba+Popup_Boton_Altura  

Si_Boton_Izq	    EQU		Popup_txt_Izq                           ;Posiciones del borde izquierdo y derecho del primer botón del tercer mensaje
Si_Boton_der	    EQU		Si_Boton_Izq+Popup_Boton_Anchura
Si_txt_Arriba       EQU     Popup_B_txt3_Arriba+Popup_txt3_GapY     ;Posición Y y X del inicio del texto contenido en el primer botón del tercer mensaje.
Si_txt_Izq	        EQU		Si_Boton_Izq+Popup_txt3_GapX

No_Boton_Izq	    EQU		Si_Boton_der+Popup_Boton_GapX           ;Posiciones del borde izquierdo y derecho del segundo botón del tercer mensaje
No_Boton_der	    EQU		No_Boton_Izq+Popup_Boton_Anchura
No_txt_Arriba       EQU     Popup_B_txt3_Arriba+Popup_txt3_GapY     ;Posición Y y X del inicio del texto contenido en el segundo botón del tercer mensaje.
No_txt_Izq	        EQU		No_Boton_Izq+Popup_txt3_GapX

*Tabla propiedades:
*En la tabla se irán añadiendo las bolas de colores correspondientes
*a cada turno y las pistas dadas al final de cada uno de éstos.
Tabla_Anchura		EQU		255
Tabla_Altura		EQU		500                                     ;Esta altura de la tabla donde serán pintandas las bolas se corresponde para 12 turnos.
Tabla_Arriba        EQU     30
Tabla_Izq           EQU     20
Tabla_Abajo         EQU     Tabla_Arriba+Tabla_Altura
Tabla_der           EQU     Tabla_Izq+Tabla_Anchura

Pistas_Anchura		EQU		60
Pistas_Altura		EQU		Tabla_Altura
Pistas_Arriba       EQU     30
Pistas_Izq          EQU     Tabla_der+20
Pistas_Abajo        EQU     Pistas_Arriba+Pistas_Altura
Pistas_der          EQU     Pistas_Izq+Pistas_Anchura

*Botones propiedades:
*Usados para seleccionar la bola a ser introducida
Color_Boton_Altura	EQU		20
Color_Boton_Anchura	EQU		50
Color_Boton_Izq     EQU     Pistas_der+30
Color_Boton_der     EQU     Color_Boton_Izq+Color_Boton_Anchura
Color_Boton_Gap	    EQU		5                                       ;hueco eje Y entre botones

R_Boton_Arriba	    EQU		30                                      ;Posiciones de los bordes superior e inferior de cada unos de los botones.
R_Boton_Abajo	    EQU		R_Boton_Arriba+Color_Boton_Altura

A_Boton_Arriba	    EQU		R_Boton_Abajo+Color_Boton_Gap
A_Boton_Abajo	    EQU		A_Boton_Arriba+Color_Boton_Altura

V_Boton_Arriba	    EQU		A_Boton_Abajo+Color_Boton_Gap
V_Boton_Abajo	    EQU		V_Boton_Arriba+Color_Boton_Altura

N_Boton_Arriba	    EQU		V_Boton_Abajo+Color_Boton_Gap
N_Boton_Abajo	    EQU		N_Boton_Arriba+Color_Boton_Altura

M_Boton_Arriba	    EQU		N_Boton_Abajo+Color_Boton_Gap
M_Boton_Abajo	    EQU		M_Boton_Arriba+Color_Boton_Altura

B_Boton_Arriba	    EQU		M_Boton_Abajo+Color_Boton_Gap
B_Boton_Abajo	    EQU		B_Boton_Arriba+Color_Boton_Altura

*Fichas propiedades:
*Bolas usadas para entrar la combinación deseada por el usuario.
Ficha_Altura	    EQU		30
Ficha_Anchura	    EQU		30
Ficha_Gap	        EQU		10                                      ;hueco eje Y entre la ficha de un turno y la de otro turno

*Bolas Pistas propiedades:
*Usadas para decirle al usuario cuantas ha posicionado bien y mal.
BPistas_Altura	    EQU		13
BPistas_Anchura	    EQU		13
BPistas_Gap	        EQU		5                                       ;hueco eje X entre bolas de pistas
BPistas_GapY	    EQU		5                                       ;hueco eje Y entre filas de bolas de pistas del mismo turno.

*Botón Instrucciones propiedades:
Inst_Boton_Altura	EQU		20
Inst_Boton_Anchura	EQU		200
Inst_Boton_Arriba	EQU		30
Inst_Boton_Abajo	EQU		Inst_Boton_Arriba+Inst_Boton_Altura
Inst_Boton_Izq		EQU		Color_Boton_der+30
Inst_Boton_der	    EQU		Inst_Boton_Izq+Inst_Boton_Anchura
Inst_B_txt_Arriba   EQU		Inst_Boton_Arriba+3                     ;Posición Y y X del texto dentro del botón.
Inst_B_txt_Izq	    EQU		Inst_Boton_Izq+17

*Texto Instrucciones propiedades
Texto_info_Arriba	EQU		Inst_Boton_Abajo+20
Texto_info_Izq      EQU     Inst_Boton_Izq
Texto_info_Der      EQU     Texto_info_Izq+600                      ;defino tanto el límite derecho como el inferior para borrar el texto al cerrar las instrucciones.
Texto_info_Abajo    EQU     Texto_info_Arriba+410
Texto_Info_Gap      EQU     20                                      ;espacio entre lineas del mensaje.
***************************FIN DEFINICIÓN DE CONSTANTES***************************

START:
*************************VENTANA DE CONFIGURACIÓN INICIAL*************************
        *Aparición del Pop-up 
        MOVE.L #1,D1                                                
        MOVE.L #93,D0                                               ;Ancho de pluma = 1 (La pluma es usada para hacer el contorno de las figuras)
        TRAP #15
    
        MOVE.L #VERDE,D1
        MOVE.L #80,D0                                               ;Cambio color de pluma
        TRAP #15
    
        MOVE.L #GRIS,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno (fondo del popup)
        TRAP #15
    
        MOVE.L #Popup_Izq,D1                                        ;Valor inicial X
        MOVE.L #Popup_Arriba,D2                                     ;Valor inicial Y
        MOVE.L #Popup_der,D3                                        ;Valor final X
        MOVE.L #Popup_Abajo,D4                                      ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo que limitará la zona del popup
        TRAP #15
        
        *Pido numero de bolas por turno
        MOVE.L #MSJ2,A1
        MOVE.L #95,D0
        MOVE.L #Popup_txt1_Izq,D1
        MOVE.L #Popup_txt1_Arriba,D2
        TRAP #15                                                    ;Escribir el primer mensaje en el popup
    
        MOVE.L #ROJO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        MOVE.L #Cuatro_Boton_Izq,D1                                 ;Valor inicial X
        MOVE.L #Popup_B_txt1_Arriba,D2                              ;Valor inicial Y
        MOVE.L #Cuatro_Boton_der,D3                                 ;Valor final X
        MOVE.L #Popup_B_txt1_Abajo,D4                               ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo del primer botón del primer mensaje
        TRAP #15
        MOVE.L #MSJ21,A1
        MOVE.L #95,D0
        MOVE.L #Cuatro_txt_Izq,D1
        MOVE.L #Cuatro_txt_Arriba,D2
        TRAP #15                                                    ;Escribir dentro del botón recien dibujado el texto que le corresponde a este.
    
        MOVE.L #Cinco_Boton_Izq,D1                                  ;Valor inicial X
        MOVE.L #Popup_B_txt1_Arriba,D2                              ;Valor inicial Y
        MOVE.L #Cinco_Boton_der,D3                                  ;Valor final X
        MOVE.L #Popup_B_txt1_Abajo,D4                               ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo del segundo botón del primer mensaje
        TRAP #15
        MOVE.L #MSJ22,A1
        MOVE.L #95,D0
        MOVE.L #Cinco_txt_Izq,D1
        MOVE.L #Cinco_txt_Arriba,D2
        TRAP #15                                                    ;Escribir dentro del botón recien dibujado el texto que le corresponde a este.
    
        MOVE.L #Seis_Boton_Izq,D1                                   ;Valor inicial X
        MOVE.L #Popup_B_txt1_Arriba,D2                              ;Valor inicial Y
        MOVE.L #Seis_Boton_der,D3                                   ;Valor final X
        MOVE.L #Popup_B_txt1_Abajo,D4                               ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo del tercer botón del primer mensaje
        TRAP #15
        MOVE.L #MSJ23,A1
        MOVE.L #95,D0
        MOVE.L #Seis_txt_Izq,D1
        MOVE.L #Seis_txt_Arriba,D2
        TRAP #15                                                    ;Escribir dentro del botón recien dibujado el texto que le corresponde a este.
    
CHKB    *Compruebo numero de bolas por turno
        MOVE.L #0,D1 
        MOVE.L #61,D0                                               ;Compruebo el estado del ratón (posición X,Y será almacenada en D1 y pulsación del botón en D0)
        TRAP #15
    
        CMP.B #1,D0
        BCS CHKB                                                    ;si no está ningún botón del ratón pulsado sigue esperando a que lo esté
    
        SWAP D1                                                     ;intercambio la parte alta con la baja para así comprobar el valor de Y
        CMP.W #Popup_B_txt1_Arriba,D1
        BCS CHKB                                                    
        CMP.W #Popup_B_txt1_Abajo,D1
        BHI CHKB
    
        SWAP D1                                                     ;intercambio nuevamente para volver a tener la WORD X en la parte baja
        CMP.W #Cuatro_Boton_Izq,D1
        BCS CHKB
        CMP.W #Cuatro_Boton_Der,D1
        BHI CHK_5
        MOVE.B #4,NBOLAS                                            ;El usuario ha pinchado en el botón de 4 bolas
        JMP CANT
    
CHK_5   CMP.W #Cinco_Boton_Izq,D1
        BCS CHKB
        CMP.W #Cinco_Boton_Der,D1
        BHI CHK_6
        MOVE.B #5,NBOLAS                                            ;El usuario ha pinchado en el botón de 5 bolas
        JMP CANT 
        
CHK_6   CMP.W #Seis_Boton_Izq,D1
        BCS CHKB
        CMP.W #Seis_Boton_Der,D1
        BHI CHKB
        MOVE.B #6,NBOLAS                                            ;El usuario ha pinchado en el botón de 6 bolas
        
CANT    *Pido cantidad de turnos por partida
        MOVE.L #GRIS,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        MOVE.L #MSJ3,A1
        MOVE.L #95,D0
        MOVE.L #Popup_txt2_Izq,D1
        MOVE.L #Popup_txt2_Arriba,D2
        TRAP #15
    
        MOVE.L #ROJO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        
        MOVE.L #Doce_Boton_Izq,D1                                   ;Valor inicial X
        MOVE.L #Popup_B_txt2_Arriba,D2                              ;Valor inicial Y
        MOVE.L #Doce_Boton_der,D3                                   ;Valor final X
        MOVE.L #Popup_B_txt2_Abajo,D4                               ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo
        TRAP #15
        MOVE.L #MSJ31,A1
        MOVE.L #95,D0
        MOVE.L #Doce_txt_Izq,D1
        MOVE.L #Doce_txt_Arriba,D2
        TRAP #15
    
        MOVE.L #Dieci_Boton_Izq,D1                                  ;Valor inicial X
        MOVE.L #Popup_B_txt2_Arriba,D2                              ;Valor inicial Y
        MOVE.L #Dieci_Boton_der,D3                                  ;Valor final X
        MOVE.L #Popup_B_txt2_Abajo,D4                               ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo
        TRAP #15
        MOVE.L #MSJ32,A1
        MOVE.L #95,D0
        MOVE.L #Dieci_txt_Izq,D1
        MOVE.L #Dieci_txt_Arriba,D2
        TRAP #15
        
CHKC    *Compruebo cantidad de turnos por partida
        MOVE.L #0,D1 
        MOVE.L #61,D0                                               ;check mouse state
        TRAP #15
    
        CMP.B #1,D0
        BCS CHKC
    
        SWAP D1
        CMP.W #Popup_B_txt2_Arriba,D1
        BCS CHKC
        CMP.W #Popup_B_txt2_Abajo,D1
        BHI CHKC
    
        SWAP D1
        CMP.W #Doce_Boton_Izq,D1
        BCS CHKC
        CMP.W #Doce_Boton_Der,D1
        BHI CHK_DI
        MOVE.B #12,TURNO                                            ;El usuario ha pinchado en el botón de 12 turnos.
        JMP PERM
    
CHK_DI  CMP.W #Dieci_Boton_Izq,D1
        BCS CHKC
        CMP.W #Dieci_Boton_Der,D1
        BHI CHKC
        MOVE.B #16,TURNO                                            ;El usuario ha pinchado en el botón de 16 turnos.
        
PERM    *Pido ¿Permitir repeticiones?
        MOVE.L #GRIS,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        MOVE.L #MSJ4,A1
        MOVE.L #95,D0
        MOVE.L #Popup_txt3_Izq,D1
        MOVE.L #Popup_txt3_Arriba,D2
        TRAP #15
    
        MOVE.L #ROJO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        
        MOVE.L #Si_Boton_Izq,D1                                     ;Valor inicial X
        MOVE.L #Popup_B_txt3_Arriba,D2                              ;Valor inicial Y
        MOVE.L #Si_Boton_der,D3                                     ;Valor final X
        MOVE.L #Popup_B_txt3_Abajo,D4                               ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo
        TRAP #15
        MOVE.L #MSJSI,A1
        MOVE.L #95,D0
        MOVE.L #Si_txt_Izq,D1
        MOVE.L #Si_txt_Arriba,D2
        TRAP #15
    
        MOVE.L #No_Boton_Izq,D1                                     ;Valor inicial X
        MOVE.L #Popup_B_txt3_Arriba,D2                              ;Valor inicial Y
        MOVE.L #No_Boton_der,D3                                     ;Valor final X
        MOVE.L #Popup_B_txt3_Abajo,D4                               ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo
        TRAP #15
        MOVE.L #MSJNO,A1
        MOVE.L #95,D0
        MOVE.L #No_txt_Izq,D1
        MOVE.L #No_txt_Arriba,D2
        TRAP #15
        
CHKP    *Compruebo ¿Permitir repeticiones?
        MOVE.L #0,D1 
        MOVE.L #61,D0                                               ;check mouse state
        TRAP #15
    
        CMP.B #1,D0
        BCS CHKP
    
        SWAP D1
        CMP.W #Popup_B_txt3_Arriba,D1
        BCS CHKP
        CMP.W #Popup_B_txt3_Abajo,D1
        BHI CHKP
    
        SWAP D1
        CMP.W #Si_Boton_Izq,D1
        BCS CHKP
        CMP.W #Si_Boton_Der,D1
        BHI CHK_NO
        MOVE.B #1,REPET                                             ;El usuario ha pinchado en "Sí permitir repeticiones"
        JMP FINPOP
    
CHK_NO  CMP.W #No_Boton_Izq,D1
        BCS CHKP
        CMP.W #No_Boton_Der,D1
        BHI CHKP
        MOVE.B #0,REPET                                             ;El usuario ha pinchado en "No permitir repeticiones"

*Fin del Pop-up
FINPOP  MOVE.B #33,D0
        MOVE.L #1024*$10000+550,D1                                  ;Establecer la resolución de la pantalla
        CMP.B #16,TURNO
        BCS NOMOD                                                   ;si los turnos son 12 no modifiques la altura
        ADD.W #150,D1
NOMOD   TRAP #15
    
        MOVE.L #94,D0                                               ;Limpiar pantalla
        TRAP #15
*************************FIN VENTANA DE CONFIGURACIÓN INICIAL***********************

**********************************DIBUJO ESTRUCTURA*********************************    
        *RECTANGULO TABLA*
        MOVE.L #AZUL,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
    
        MOVE.L #Tabla_Izq,D1                                        ;Valor inicial X
        MOVE.L #Tabla_Arriba,D2                                     ;Valor inicial Y
        MOVE.L #Tabla_der,D3                                        ;Valor final X
        MOVE.L #Tabla_Abajo,D4                                      ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo tabla
        CMP.B #16,TURNO
        BCS NOALARG
        ADD.L #150,D4                                               ;si hemos configurado 16 turnos alargamos la tabla
NOALARG TRAP #15
    
        *RECTANGULO PISTAS*
        MOVE.L #Pistas_Izq,D1                                       ;Valor inicial X
        MOVE.L #Pistas_der,D3                                       ;Valor final X
        MOVE.L #87,D0                                               ;Dibujar rectangulo pistas (aprovecho el valor de D2 y D4 del rectangulo tabla)
        TRAP #15
    
        *RECTANGULO COLOR ROJO*
        MOVE.L #ROJO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
    
        MOVE.L #Color_Boton_Izq,D1                                  ;Valor inicial X
        MOVE.L #R_Boton_Arriba,D2                                   ;Valor inicial Y
        MOVE.L #Color_Boton_der,D3                                  ;Valor final X
        MOVE.L #R_Boton_Abajo,D4                                    ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo boton color rojo
        TRAP #15
    
        *RECTANGULO COLOR AMARILLO*
        MOVE.L #AMARILLO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
    
        MOVE.L #Color_Boton_Izq,D1                                  ;Valor inicial X
        MOVE.L #A_Boton_Arriba,D2                                   ;Valor inicial Y
        MOVE.L #Color_Boton_der,D3                                  ;Valor final X
        MOVE.L #A_Boton_Abajo,D4                                    ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo boton color amarillo
        TRAP #15
    
        *RECTANGULO COLOR VERDE*
        MOVE.L #VERDE,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        
        MOVE.L #Color_Boton_Izq,D1                                  ;Valor inicial X
        MOVE.L #V_Boton_Arriba,D2                                   ;Valor inicial Y
        MOVE.L #Color_Boton_der,D3                                  ;Valor final X
        MOVE.L #V_Boton_Abajo,D4                                    ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo boton color verde
        TRAP #15
    
        *RECTANGULO COLOR NEGRO*
        MOVE.L #NEGRO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
    
        MOVE.L #Color_Boton_Izq,D1                                  ;Valor inicial X
        MOVE.L #N_Boton_Arriba,D2                                   ;Valor inicial Y
        MOVE.L #Color_Boton_der,D3                                  ;Valor final X
        MOVE.L #N_Boton_Abajo,D4                                    ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo boton color negro
        TRAP #15
    
        *RECTANGULO COLOR MARRON*
        MOVE.L #MARRON,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
    
        MOVE.L #Color_Boton_Izq,D1                                  ;Valor inicial X
        MOVE.L #M_Boton_Arriba,D2                                   ;Valor inicial Y
        MOVE.L #Color_Boton_der,D3                                  ;Valor final X
        MOVE.L #M_Boton_Abajo,D4                                    ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo boton color marron
        TRAP #15
    
        *RECTANGULO COLOR BLANCO*
        MOVE.L #BLANCO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
    
        MOVE.L #Color_Boton_Izq,D1                                  ;Valor inicial X
        MOVE.L #B_Boton_Arriba,D2                                   ;Valor inicial Y
        MOVE.L #Color_Boton_der,D3                                  ;Valor final X
        MOVE.L #B_Boton_Abajo,D4                                    ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo boton color blanco
        TRAP #15
    
        *RECTANGULO BOTON INSTRUCCIONES*
        MOVE.L #ROJO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
    
        MOVE.L #Inst_Boton_Izq,D1                                   ;Valor inicial X
        MOVE.L #Inst_Boton_Arriba,D2                                ;Valor inicial Y
        MOVE.L #Inst_Boton_der,D3                                   ;Valor final X
        MOVE.L #Inst_Boton_Abajo,D4                                 ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo boton instrucciones
        TRAP #15
 
        MOVE.L #MSJ8,A1
        MOVE.L #95,D0
        MOVE.L #Inst_B_txt_Izq,D1
        MOVE.L #Inst_B_txt_Arriba,D2
        TRAP #15                                                    ;Escribo el mensaje dentro del botón de instrucciones
******************************FIN DIBUJO ESTRUCTURA*************************************        
        
        *PARAGRAFO IMPORTANTE INICIALIZO PUNTO DONDE EMPIEZO A PINTAR FICHAS Y PISTAS
        MOVE.W #Tabla_izq,POSX
        MOVE.W #Tabla_Arriba,POSY
        ADD.W #Ficha_Gap,POSY
    
        MOVE.W #Pistas_Izq,POSPX
        MOVE.W #Pistas_Arriba,POSPY
        ADD.W #Ficha_Gap,POSPY

    
*#################################COMIENZO DEL JUEGO####################################           
NI		JSR INIRND                                                  ;Inicializa la semilla (solo una vez por ejecución).
        MOVE.L #COMB,A0                                             ;Indico donde guardaré la combinación ganadora.
    	MOVE.L #1, D4                                               ;inizializo las veces que obtengo un numero aleatorio
OTRO    MOVE.L #RANGO,D0        
        JSR LAB_RND                                                 ;Obtiene un valor entre 0-RANGO
        CMP.B #1,REPET
        BEQ GUARDA
        MOVE.L #1, D5
NREP    MOVE.L #COMB, A0
        CMP.L #1, D4
        BEQ GUARDA
COMPS   CMP.B (A0)+, D0
        BEQ OTRO
        ADD.L #1, D5
        CMP.L D4, D5
        BNE COMPS
        
GUARDA  MOVE.B D0,(A0)+                                             ;Mueve el número aleatorio a COMB
        CMP.L #6,D4             
        BEQ OTROTURNO                                               ;Si ya ha obtenido los 4 números, salta. 
        ADD.L #1, D4
        JMP OTRO	                                                ;Y si todavía no, obtiene el siguiente número.     

OTROTURNO    
******************************OBTENER FICHAS TURNO***************************************
        MOVE.B #0,CONTF                                             ;inicializo el "contador de numero de fichas introducidas en el turno actual".
        MOVE.L #COMBU,A0                                            ;indico la dirección de la primera posición de la combinación introducida por el usuario.

SIGUEOB MOVE.L #0,D1 
        MOVE.L #61,D0                                               ;check mouse state
        TRAP #15    
        CMP.B #1,D0
        BCS SIGUEOB
    
        CMP.W #Color_Boton_Izq,D1
        BCS CHKINST
        CMP.W #Color_Boton_der,D1
        BHI CHKINST
        
        SWAP D1
        
        CMP.W #R_Boton_Arriba,D1
        BCS RELAJA
        CMP.W #R_Boton_Abajo,D1
        BHI CHK_A
        MOVE.L #ROJO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno a rojo ya que ha sido el boton seleccionado
        TRAP #15
        JSR PFICHAS                                                 ;subrutina pintafichas
        MOVE.B #0,(A0)+
        ADD.B #1,CONTF                                              ;aumento el contador de numero de fichas introducidas en la fila actual. 
        JMP RELAJA
    
CHK_A   CMP.W #A_Boton_Arriba,D1
        BCS RELAJA
        CMP.W #A_Boton_Abajo,D1
        BHI CHK_V
        MOVE.L #AMARILLO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        JSR PFICHAS
        MOVE.B #1,(A0)+ 
        ADD.B #1,CONTF 
        JMP RELAJA 
        
CHK_V   CMP.W #V_Boton_Arriba,D1
        BCS RELAJA
        CMP.W #V_Boton_Abajo,D1
        BHI CHK_N
        MOVE.L #VERDE,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        JSR PFICHAS
        MOVE.B #2,(A0)+
        ADD.B #1,CONTF
        JMP RELAJA

CHK_N   CMP.W #N_Boton_Arriba,D1
        BCS RELAJA
        CMP.W #N_Boton_Abajo,D1
        BHI CHK_M
        MOVE.L #NEGRO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        JSR PFICHAS
        MOVE.B #3,(A0)+
        ADD.B #1,CONTF
        JMP RELAJA

CHK_M   CMP.W #M_Boton_Arriba,D1
        BCS RELAJA
        CMP.W #M_Boton_Abajo,D1
        BHI CHK_B
        MOVE.L #MARRON,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        JSR PFICHAS
        MOVE.B #4,(A0)+
        ADD.B #1,CONTF
        JMP RELAJA

CHK_B   CMP.W #B_Boton_Arriba,D1
        BCS RELAJA
        CMP.W #B_Boton_Abajo,D1
        BHI RELAJA
        MOVE.L #BLANCO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        JSR PFICHAS
        MOVE.B #5,(A0)+
        ADD.B #1,CONTF
        JMP RELAJA       

CHKINST CMP.W #Inst_Boton_Izq,D1
        BCS RELAJA
        CMP.W #Inst_Boton_Der,D1
        BHI RELAJA
        SWAP D1
        CMP.W #Inst_Boton_Arriba,D1
        BCS RELAJA
        CMP.W #Inst_Boton_Abajo,D1
        BHI RELAJA
        
        MOVE.L #ROJO,D1
        MOVE.L #81,D0                                               ;El botón de instrucciones ha sido pulsado, me dispongo a cambiar el boton. 
        TRAP #15
    
        MOVE.L #Inst_Boton_Izq,D1                                   ;Valor inicial X
        MOVE.L #Inst_Boton_Arriba,D2                                ;Valor inicial Y
        MOVE.L #Inst_Boton_der,D3                                   ;Valor final X
        MOVE.L #Inst_Boton_Abajo,D4                                 ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo de boton instrucciones (superpuesto al anterior)
        TRAP #15
        
        *Según el que haya, cambio del boton de "Ver Instrucciones" por el de "Cerrar Instrucciones" o viceversa.
        CMP.B  #1,BINST                                             ;si la bandera de las instrucciones está levantada, las cierro.
        BNE ABREINS
        MOVE.L #MSJ8,A1                                 
        MOVE.L #95,D0
        MOVE.L #Inst_B_txt_Izq,D1
        MOVE.L #Inst_B_txt_Arriba,D2
        TRAP #15                                                    ;En el boton de instrucciones escribo "Ver instrucciones"
        MOVE.L #NEGRO,D1
        MOVE.L #80,D0                                               ;Cambio color de pluma
        TRAP #15
        MOVE.L #NEGRO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        MOVE.L #Texto_info_Izq,D1                                   ;Valor inicial X
        MOVE.L #Texto_info_Arriba,D2                                ;Valor inicial Y
        MOVE.L #Texto_info_Der,D3                                   ;Valor final X
        MOVE.L #Texto_info_Abajo,D4                                 ;Valor final Y
        MOVE.L #87,D0                                               ;Dibujar rectangulo para borrar el texto de las instrucciones
        TRAP #15
        MOVE.B #0,BINST                                             ;BAJO BANDERA
        MOVE.L #VERDE,D1
        MOVE.L #80,D0                                               ;vuelvo a dejar el pen color como estaba
        TRAP #15
        JMP RELAJA
    
ABREINS MOVE.B #1,BINST                                             ;LEVANTO BANDERA DE INSTRUCCIONES ACTIVAS
        MOVE.L #MSJ9,A1
        MOVE.L #95,D0
        MOVE.L #Inst_B_txt_Izq,D1
        MOVE.L #Inst_B_txt_Arriba,D2
        TRAP #15                                                    ;En el boton de instrucciones escribo "Cerrar instrucciones"
        MOVE.L #NEGRO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        MOVE.L #0,D3
        MOVE.L #MSJ1,A1                                             ;pongo A1 apuntando a la primera posición del mensaje
        MOVE.L #Texto_Info_Izq,D1
        MOVE.L #Texto_Info_Arriba,D2
ESCRIBE CMP.B #14,D3                                                ;ha escrito ya las 14 lineas del mensaje?
        BEQ RELAJA
        MOVE.L #95,D0
        TRAP #15                                                    ;escribe hasta encontrar un cero.
        ADD.L #1,D3                                                 ;aumento el contador.
        ADD.L #65,A1                                                ;APUNTO A LA SIGUIENTE LINEA (cada linea ocupa 64 bytes)
        ADD.L #Texto_Info_Gap,D2                                    ;añado un espacio entre lineas
        JMP ESCRIBE

RELAJA  MOVE.L #0,D1
        MOVE.L #61,D0                                               ;miro el estado del ratón
        TRAP #15
        CMP.B #0,D0                                                 ;¿sigue pulsado el ratón?
	    BNE RELAJA
	
	    MOVE.B CONTF,D1
	    CMP.B NBOLAS,D1
	    BCS SIGUEOB                                                 ;si todavía no tengo la cantidad de fichas que indique NBOLAS sigo obteniéndolas
************************FIN OBTENER FICHAS TURNO***********************************


************************COMPROBACION FICHAS TURNO**********************************	
        *Comprobación masiva inicial (PASO 1)  	
    	MOVE.L #COMB, A0                                            ; Busco direccion inicial solucion
        MOVE.L #COMBU, A1                                           ; Busco direccion inicial combinacion usuario
        MOVE.L #1,D0                                                ; inicializo un contador
        
        
CMPTODO CMP.B (A0)+,(A1)+                                           ; Comparo las primeras cuatro bolas tanto de la solucion como de las introducidas por el usuario
        BNE CMP11                                                   ; Cuando encuentre una que ya no es igual pasaré a compararlas una a una
        CMP.B NBOLAS,D0                                             ; Si son iguales miro si sólo hay NBOLAS 
        BEQ GANAR                                                   ; Si es así ya he ganado
        ADD.B #1,D0
        JMP CMPTODO
    	
        *Comprobación en paralelo (PASO 2)      
CMP11   CMP.B #1,TURNO                                              ;Compruebo si al usuario le quedan más turnos.
    	BLS PERDER                                                  ; Si no es así, ha perdido
        MOVE.L #COMB, A0                                            ; Vuelvo a buscar la direccion inicial de la solucion
        MOVE.L #COMBU, A1                                           ; Vuelvo a buscar la direccion inicial de la combinacion del usuario
        MOVE.L #CONT, A3                                            ; Busco la direccion inicial de los contadores que me indican si las posiciones de la solucion encontraron pareja
        MOVE.L #CONTU, A4                                           ; Lo mismo para las posiciones de la combinacion de usuario
        MOVE.B #0, D0                                               ; Inicializo un contador que me dirá la bola que estoy comprobando
        
        MOVE.B NBOLAS, D6
SIG11   ADD.L #1, D0                                                ; Añado 1 al contador 
        CMP.B (A0)+, (A1)+                                          ; Compruebo las bolas a las que apunta el contador
        BNE MAL             
BIEN    MOVE.B #1, (A3)+                                            ; Si son iguales actualizo sus contadores indicandolo y voy a ver si era la ultima
        MOVE.B #1, (A4)+
        JMP CFIN
MAL     MOVE.B #0, (A3)+                                            ; Si no eran iguales tambien actualizo sus contadores
        MOVE.B #0, (A4)+   
CFIN    CMP.B D6, D0                                                ; Compruebo si era la ultima bola a comprobar
        BNE SIG11                                                   ; si no lo era compruebo la siguiente
        
        *Comprobación en abanico (PASO 3)
        MOVE.L #COMB, A0                                            ; Vuelvo a buscar la direccion inicial de la solucion
        MOVE.L #CONT, A2                                            ; Vuelvo a buscar la direccion inicial de contador de estado de la solución
        MOVE.B #0, D0                                               ; Inicializo el contador que nos indicara la posición de la solución que se está comprobando (cont abanico sup)
        
        *(Abanico nivel superior)      
ABAS    MOVE.B (A0)+, D1                                            ; Cargo el dato de la solución 
        MOVE.B (A2)+, D3                                            ; Cargo el dato del contador de estado de la solución
        MOVE.L #COMBU, A1                                           ; Vuelvo a buscar la direccion inicial de la combinación del usuario
        MOVE.L #CONTU, A3                                           ; Vuelvo a buscar la direccion inicial de contador de estado de la combinacion del usuario
        MOVE.L #0, D5                                               ; Inicializo el contador que nos indicara la posición de la combinación del usuario que se está comprobando (cont abanico inf)
        CMP.B #1, D3                                                ; Compruebo si esta parte de la solución ya estaba asignada a una de la combinacion del usuario
        BEQ FINABAS                                                 ; Si es así miro si era la última de la solucion

        *(Abanico nivel inferior)  
ABAI    ADD.L #1, D5                                                ; Incremento el contador del abanico inferior
        MOVE.B (A1)+, D2                                            ; Cargo el dato de la combinación del usuario
        CMP.B #1, (A3)                                              ; Compruebo si la bola de la solución ya está en común con una de la solución del usuario
        BEQ FINABAI                                                 ; Si es así no compruebo y voy directamente a ver si era la ultima
        CMP.B D1, D2                                                ; Compruebo si las bolas que estoy comparando son iguales
        BNE FINABAI                                                 ; Si no son iguales voy a buscar la siguiente bola de la combinacion del usuario
        MOVE.B #1, (A3)+                                            ; Si son iguales lo indico en el contador de estado de la combinacion del usuario
        JMP FINABAS                                                 ; Compruebo si era la última comprobacion necesaria

FINABAI ADD.B #0, (A3)+                                             ; Muevo el contador de estado de la combinacion de usuario a la siguiente posicion
        CMP.B D6, D5                                                ; Compruebo si era la última bola
        BNE ABAI                                                    ; Si no lo era paso a la siguiente bola de la combinacion del usuario
        
FINABAS ADD.B #1, D0                                                ; Incremento el contador de abanico superior
        CMP.B D6, D0                                                ; Compruebo si era la última bola de la solucion
        BNE ABAS                                                    ; Si no lo era paso a la siguiente bola de la solucion

        *Total Blancas y Negras
        MOVE.L #0, D0                                               ; Creo un contador que indique el final del bucle
        MOVE.L #CONT, A0                                            ; Busco la direccion inicial de los contadores de la solucion 
        MOVE.L #CONTU, A1                                           ; Lo mismo para las posiciones de la combinacion de usuario
        MOVE.L #0, D1                                               ; Inicializo los contadores donde guardaré la cantidad de contadores activos en cada uno
        MOVE.L #0, D2                                               ; Para después calcular el número de blancas y negras
        
BNCONT  ADD.B (A0)+, D1                                             ; Sumo cuantas bolas estan bien posicionadas en una variable
        ADD.B (A1)+, D2                                             ; Sumo cuantas bolas estan bien y mal posicionadas en otra variable
        ADD.B #1, D0                                                ; Incrementa el contador 
        CMP.L D6, D0                                                ; Comprueba si era la ultima posición a comprobar
        BNE BNCONT                                                  ; Si no es así siguie sumando        
        SUB.L D1, D2                                                ; Resto las que están bien del total para obtener las mal posicionadas	    
        
        MOVE.B D1,TOTALN
        MOVE.B D2,TOTALB
************************FIN COMPROBACION FICHAS TURNO**********************************
        
        *Preparo nuevo turno    	
    	SUB.B #1,TURNO
        
        *Preparo sitios a pintar de nuevo turno
        MOVE.L #96,D0                                               ;obtengo la posición actual del cursor
        TRAP #15
        
        MOVE.B #0,CONTP                                             ;Pongo a cero el contador de pistas pintadas.
        MOVE.W #Pistas_Izq,POSPX                                    ;REINICIALIZO LEFT X de pistas
        MOVE.W D2,POSPY                                             ;Reinicializo Valor inicial Y de pistas (guardo la posición actual de Y, no la del próximo turno ya que ahora sacaré las pistas de ESTE turno)
        
        MOVE.W #Tabla_Izq,POSX                                      ;REINICIALIZO LEFT X
        ADD.W #Ficha_Altura,D2                                      ;pre-Valor final Y   
        ADD.W #Ficha_Gap,D2                                         ;Valor final Y
        MOVE.W D2,POSY                                              ;(la Y se queda apuntando a la que será la parte de arriba de la siguiente ficha)
        

****************************MOSTRAR PISTAS TURNO***************************************
PISTASN CMP.B #0,TOTALN
        BEQ PISTASB
        JSR SALTAL                                                  ;COMPRUEBO SI DEBO SALTAR LINEA
        MOVE.L #NEGRO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        JSR PPISTAS
        ADD.B #1,CONTP
        SUB.B #1,TOTALN
        JMP PISTASN
        
PISTASB CMP.B #0,TOTALB
        BEQ OTROTURNO
        JSR SALTAL                                                  ;COMPRUEBO SI DEBO SALTAR LINEA
        MOVE.L #BLANCO,D1
        MOVE.L #81,D0                                               ;Cambio color de relleno
        TRAP #15
        JSR PPISTAS
        ADD.B #1,CONTP
        SUB.B #1,TOTALB
        JMP PISTASB
****************************FIN MOSTRAR PISTAS TURNO***************************************


****************************CONCLUSIÓN DE LA PARTIDA***************************************    	
GANAR	LEA	GWin,A1	                                                ;reproducir el sonido de victoria.
	    MOVE.L #73,D0
	    TRAP #15
        MOVE.L #GRIS,D1
        MOVE.L #81,D0
        TRAP #15
        MOVE.L #Popup_Izq,D1
        MOVE.L #Popup_Arriba,D2
        MOVE.L #Popup_der,D3
        MOVE.L #Popup_Abajo,D4
        MOVE.L #87,D0
        TRAP #15
        
        MOVE.L #MSJ5,A1                                             ;Saco un mensaje de enhorabuena
        MOVE.L #95,D0
        MOVE.L #Popup_txt1_Izq,D1
        MOVE.L #Popup_txt1_Arriba,D2
        TRAP #15
        
        JSR FINAL                                                   ;salto a la subrutina que me dibuja la solucion
        JMP OTRA
    	
PERDER	LEA	GOver,A1	                                            ;reproducir el sonido de game over.
	    MOVE.L #73,D0
	    TRAP #15
	    MOVE.L #GRIS,D1
        MOVE.L #81,D0
        TRAP #15
        MOVE.L #Popup_Izq,D1
        MOVE.L #Popup_Arriba,D2
        MOVE.L #Popup_der,D3
        MOVE.L #Popup_Abajo,D4
        MOVE.L #87,D0
        TRAP #15
        
        MOVE.L #MSJ6,A1
        MOVE.L #95,D0
        MOVE.L #Popup_txt1_Izq,D1
        MOVE.L #Popup_txt1_Arriba,D2
        TRAP #15
        
        JSR FINAL

OTRA    MOVE.L #GRIS,D1
        MOVE.L #81,D0
        TRAP #15
        MOVE.L #MSJ7,A1                                             ;saco mensaje pidiendo volver a jugar
        MOVE.L #95,D0
        MOVE.L #Popup_txt3_Izq,D1
        MOVE.L #Popup_txt3_Arriba,D2
        TRAP #15
    
        MOVE.L #ROJO,D1
        MOVE.L #81,D0                                               ;set fill color del boton
        TRAP #15
        
        MOVE.L #Si_Boton_Izq,D1                                     ;Dibujo boton
        MOVE.L #Popup_B_txt3_Arriba,D2
        MOVE.L #Si_Boton_der,D3
        MOVE.L #Popup_B_txt3_Abajo,D4
        MOVE.L #87,D0
        TRAP #15
        MOVE.L #MSJSI,A1                                            ;Pongo el mensaje del boton "Si"
        MOVE.L #95,D0
        MOVE.L #Si_txt_Izq,D1
        MOVE.L #Si_txt_Arriba,D2
        TRAP #15
    
        MOVE.L #No_Boton_Izq,D1                                     ;Dibujo el otro boton
        MOVE.L #Popup_B_txt3_Arriba,D2
        MOVE.L #No_Boton_der,D3
        MOVE.L #Popup_B_txt3_Abajo,D4
        MOVE.L #87,D0
        TRAP #15
        MOVE.L #MSJNO,A1                                            ;pongo el mensaje del botón "No"
        MOVE.L #95,D0
        MOVE.L #No_txt_Izq,D1
        MOVE.L #No_txt_Arriba,D2
        TRAP #15
        
OTRAP   MOVE.L #0,D1 
        MOVE.L #61,D0                                               ;check mouse state
        TRAP #15
    
        CMP.B #1,D0                                                 ;Está pulsado?
        BCS OTRAP                                                   ;Si no es así sigo comprobando
    
        SWAP D1
        CMP.W #Popup_B_txt3_Arriba,D1
        BCS OTRAP
        CMP.W #Popup_B_txt3_Abajo,D1
        BHI OTRAP
    
        SWAP D1
        CMP.W #Si_Boton_Izq,D1
        BCS OTRAP
        CMP.W #Si_Boton_Der,D1
        BHI OTRANO
        JMP START                                                   ;Salto al principio
    
OTRANO  CMP.W #No_Boton_Izq,D1
        BCS OTRAP
        CMP.W #No_Boton_Der,D1
        BHI OTRAP        
    	                                                            ;No hacemos nada
   	     
*******************************FIN CONCLUSIÓN DE LA PARTIDA********************************
*####################################FIN DEL JUEGO#########################################
FIN 	SIMHALT


******************DEFINICIÓN DE SUBRUTINAS Y RESERVADO DE MEMORIA**************************
*ALGORITMO (NO TOCAR):  Necesita inicializar la semilla, PRNL, con un long, y devuelve en D0 el número pseudoaleatorio 16 bits
RANGO 	EQU 5
INIRND  MOVE.L #8,D0           
		TRAP #15                ;Esta subrutina inicializa la semilla a partir del reloj
		MOVE.L D1,PRNL          ;En D1 obtenemos las centesimas de segundo desde media noche
        RTS
LAB_RND MOVEM.L D1-D3,-(A7)     ;guarda registros utilizados
        MOVE.L D0,D1
        ADD.L #1,D1             ;calculamos el rango para un valor más (luego lo eliminamos)
        MOVE.L #$FFFF,D0
        DIVU D1,D0              ;obtiene el factor de escala rango
        AND.L #$FFFF,D0         ;elimina resto
        ADD.L #1,D0             ;sumamos 1 al factor de escala para eliminar el posible valor de más
        MOVE.L D0,D3            ;pasamos factor de escala a D3
		MOVE.L	PRNL,D0		    ;get current seed longword
		MOVEQ	#$AF-$100,d1    ;set EOR value
		MOVEQ		#19,d2		;do this 19 times
Ninc0	ADD.L		d0,d0		;shift Izq 1 bit
		BCC.S		Ninc1		;if bit not set skip feedback
		EOR.B		D1,D0		;do Galois LFSR feedback
Ninc1	SUBQ #1,D2
		BNE Ninc0			    ;loop
		MOVE.L	D0,PRNL		    ;save back to seed longword
		SWAP D0		            ;Obtiene la palabra alta
		AND.L #$FFFF,D0         ;Se queda con esa palabra 0-65535
        DIVU D3,D0              ;aplicamos factor de escala   	 
		AND.L #$FFFF,D0         ;Se queda con el cociente (solo 16 bits)
		MOVEM.L (A7)+,D1-D3
        RTS
PRNL	DS.L 1                  ;Esta variable global sirve para el funcionamiento del algoritmo RANDOM
*FIN ALGORITMO

*Subrutina que pinta la ficha segun la posición actual del cursor.
PFICHAS MOVE.W POSX,D1
        MOVE.W POSY,D2
        MOVE.L #86,D0
        TRAP #15
        ADD.W #Ficha_Gap,D1                                         ;añado el gap a la izquierda de la ficha, LEFT X   
        MOVE.W D1,D3
        ADD.W #Ficha_Anchura,D3                                     ;RIGHT X
        MOVE.W D2,D4
        ADD.W #Ficha_Altura,D4                                      ;Valor final Y    
        MOVE.L #88,D0                                               ;draw ellipse
        TRAP #15       
        MOVE.W D3,POSX                                              ;muevo la posición X donde ha terminado esta ficha a la que será la inicial de la siguiente.     
        RTS
*Subrutina que pinta la pista segun la posición actual del cursor.
PPISTAS MOVE.W POSPX,D1
        MOVE.W POSPY,D2
        MOVE.L #86,D0
        TRAP #15
        ADD.W #BPistas_Gap,D1                                       ;añado el gap a la izquierda de la ficha, LEFT X   
        MOVE.W D1,D3
        ADD.W #BPistas_Anchura,D3                                   ;RIGHT X
        MOVE.W D2,D4
        ADD.W #BPistas_Altura,D4                                    ;Valor final Y    
        MOVE.L #88,D0                                               ;draw ellipse
        TRAP #15       
        MOVE.W D3,POSPX                                             ;muevo la posición X donde ha terminado esta ficha a la que será la inicial de la siguiente.     
        RTS 

*Subrutina que comprueba cuando debo pintar las pistas en una nueva linea
SALTAL  CMP.B #3,CONTP
        BEQ NUEVAL
        RTS
NUEVAL  MOVE.W #Pistas_Izq,POSPX                                    ;REINICIALIZO LEFT X
        ADD.W #BPistas_Altura,POSPY                                 ;pre-Valor final Y   
        ADD.W #BPistas_GapY,POSPY                                   ;Valor final Y
        RTS

*Subrutina que dibuja la pantalla cuando se gana o se pierde        
FINAL   MOVE.W #Cinco_Boton_Izq, POSX                               ;Izq x
        MOVE.W #Popup_B_txt1_Abajo,POSY                             ;upper y
        MOVE.L #86, D0                                              ;indicar posicion inicial bolas
        TRAP #15
        
        MOVE.L #0, D6                                               ;Inicio contador para ver cuantas bolas saco
        MOVE.L #COMB, A0                                            ;Busco dirección primera bola solucion   
FINALB  MOVE.B (A0)+, D5                                            ;meto bola en variable para ir comparando con cada posible resultado
        CMP.B #0, D5                                                ;Cada resultado determinara un color, que asignaré como color de fondo
        BNE FINAL1                                                  ;si no es el que busco paso al siguiente
        MOVE.L #ROJO,D1                                             ;si lo es pinto el fondo con su color
        MOVE.L #81,D0                                               ;set fill color
        TRAP #15
        JMP FINALP                                                  ;y me voy al final
FINAL1  CMP.B #1, D5                                                ;igual para los 6 colores
        BNE FINAL2    
        MOVE.L #AMARILLO,D1
        MOVE.L #81,D0                                               ;set fill color
        TRAP #15
        JMP FINALP
FINAL2  CMP.B #2, D5   
        BNE FINAL3  
        MOVE.L #VERDE,D1
        MOVE.L #81,D0                                               ;set fill color
        TRAP #15
        JMP FINALP
FINAL3  CMP.B #3, D5   
        BNE FINAL4  
        MOVE.L #NEGRO,D1
        MOVE.L #81,D0                                               ;set fill color
        TRAP #15
        JMP FINALP
FINAL4  CMP.B #4, D5   
        BNE FINAL5  
        MOVE.L #MARRON,D1
        MOVE.L #81,D0                                               ;set fill color
        TRAP #15
        JMP FINALP
FINAL5  MOVE.L #BLANCO,D1
        MOVE.L #81,D0                                               ;set fill color
        TRAP #15      
FINALP  JSR PFICHAS                                                 ;al final uso la subrutina de pintar fichas con el color de fondo que ya habré asignado
        ADD.L #1, D6                                                ;Sumo uno al contador que me dice si es la ultima bola
        CMP.B NBOLAS, D6                                            ;Lo es?    
        BNE FINALB                                                  ;Si no, vuelvo a cargar la bola siguiente y vuelvo a pintar
    	RTS
        
*Reservado de memoria           
	  	ORG $3000  	
COMB  	DS.B 6 
COMBU	DS.B 6
CONTF   DS.B 1                                                      ;CUENTO LAS FICHAS QUE YA HE PUESTO EN EL TURNO ACTUAL. AL LLEGAR A 3 COMPRUEBO VALORES.
CONTP   DS.B 1                                                      ;cuento las bolas de pistas que ya he puesto en el turno actual. Al llegar a 3 hago un salto de linea.
POSX    DS.B 2                                                      ;ALMACENO LA POSICIÓN X DE LA ÚLTIMA BOLA INTRODUCIDA
POSY    DS.B 2                                                      ;ALMACENO LA POSICIÓN Y DE LA ÚLTIMA BOLA INTRODUCIDA
POSPX   DS.B 2                                                      ;ALMACENO LA POSICIÓN X DE LA ÚLTIMA PISTA INSTORUCIDA
POSPY   DS.B 2                                                      ;ALMACENO LA POSICIÓN Y DE LA ÚLTIMA PISTA INTRODUCIDA
CONT    DS.B 6
CONTU   DS.B 6
NBOLAS  DS.B 1
TURNO   DS.B 1
REPET   DS.B 1
TOTALN  DS.B 1                                                      ;total bolas blancas
TOTALB  DS.B 1                                                      ;total bolas negras
BINST   DS.B 1                                                      ;BANDERA DEL BOTON DE INSTRUCCIONES
*ojo con las posiciones desalineadas!!!

GWin	DC.B 'GameWin.wav',0
GOver	DC.B 'GameOver.wav',0

MSJ1    DC.B 'El objetivo de Mastermind es descubrir la combinación de colores',0
        DC.B 'que el programa crea aleatoriamente al principio del programa.  ',0
        DC.B 'Se dispone de un número de intentos limitados, que es definido  ',0
        DC.B 'por el usuario. La combinación puede ser de 4, 5 o 6 colores    ',0
        DC.B 'según se defina. Cabe la posibilidad de no permitir repetición  ',0
        DC.B 'de colores en la combinación a encontrar. Cada fila de bolas    ',0
        DC.B 'corresponde a un intento distinto. La introducción de bolas es  ',0
        DC.B 'mediante la pulsación de los botones rectangulares. Tras la     ',0
        DC.B 'introducción de todas las bolas de un turno aparecerán una serie',0
        DC.B 'de bolas más pequeñas; el número de bolas negras indicará       ',0
        DC.B 'cuantas ha posicionado correctamente y el de blancas indicará   ',0
        DC.B 'cuantas han acertado el color pero no la posición.              ',0
        DC.B 'Las posiciones de estas pequeñas bolas no se corresponden con   ',0
        DC.B 'las de la combinación introducida.                              ',0
MSJ2    DC.B 'Número de bolas por turno:',0
MSJ21   DC.B '4',0
MSJ22   DC.B '5',0
MSJ23   DC.B '6',0
MSJ3  	DC.B 'Cantidad de turnos disponibles:',0
MSJ31   DC.B '12',0
MSJ32   DC.B '16',0
MSJ4  	DC.B '¿Permitir repeticiones?:',0
MSJSI   DC.B 'Sí',0
MSJNO   DC.B 'No',0  
MSJ5  	DC.B '¡¡ENHORABUENA, HA GANADO!!',0
MSJ6  	DC.B 'No dispone de más turnos, ha perdido.',0
MSJ7    DC.B 'Desea jugar de nuevo?',0
MSJ8    DC.B 'Ver Instrucciones',0
MSJ9    DC.B 'Cerrar Instrucciones',0

        END START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
