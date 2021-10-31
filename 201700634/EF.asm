include macros.asm ;archivo con los macros a utilizar





AnalizarNumero macro num
LOCAL esDecimal, masdies , Cientos,Miles, exit , esdosmil, estremil,unidad, dicemal, cien, cien2, cien3,cien4,cien5,cien6,cien7,cien8,cien9, dies2,dies3,dies4,dies5,dies6,dies7,dies8,dies9 , UNIDAD2,UNIDAD3,UNIDAD4,UNIDAD5,UNIDAD6,UNIDAD7,UNIDAD8,UNIDAD9
;adgoritmo para convertir el munero
;trear el numero 
;ya sabemos que es de largo 4 entonces tomamos numero por numero hasta encontrar un numero distinto a 0
;luego al saber en que posicion esta, entonces ya sabemos si es decimal, ciento y miles
push ax 
push bx
push cx
push si
        xor ax,ax
        xor bx,bx
        xor cx,cx
        xor si,si
        ;0000

        mov al,num[si]
        CMP al,48 ;comparamos con cero
        JNE Miles ; es numero de miles 
        
        
        cien:
        inc si
        mov al,num[si]
        CMP al,48 ;comparamos con cero
        JNE Cientos ; es numero de miles 

        
        dicemal:
        inc si
        mov al,num[si]
        CMP al,48 ;comparamos con cero
        JNE masdies ; es numero mayor a 9

        
        unidad:
        inc si
        mov al,num[si]
        CMP al,48 ;comparamos con cero
        JNE esDecimal ; es numero de 

        jmp exit

;########################################################### miles ####################################################
        Miles:
        ;print msjmil 
        print salto

        CMP al,49 ; 1
        jne esdosmil
        print pirntm
        jmp cien

        jmp exit

        esdosmil:
        CMP al,50 ; 2
        jne estremil
        print pirntm
        print pirntm
        jmp cien

        jmp exit

        estremil:
        CMP al,51 ; 3

        print pirntm
        print pirntm
        print pirntm
        jmp cien

        jmp exit


;################################################################## CIENTOS #################################################
        Cientos:

        CMP al,49 ; 1
        jne cien2
        print pirntc  
        jmp dicemal

        cien2:
        CMP al,50 ; 2
        jne cien3
        print pirntc  
        print pirntc  
        jmp dicemal

        cien3:
        CMP al,51 ; 3
        jne cien4
        print pirntc  
        print pirntc  
        print pirntc  
        jmp dicemal

        cien4:
        CMP al,52 ; 4
        jne cien5
        print pirntc  
        print pirntd  
        jmp dicemal

        cien5:
        CMP al,53 ; 5
        jne cien6
        print pirntd 
        jmp dicemal

        cien6:
        CMP al,54 ; 6
        jne cien7
        print pirntd 
        print pirntc 
        jmp dicemal

        cien7:
        CMP al,55 ; 7
        jne cien8
        print pirntd 
        print pirntc 
        print pirntc 
        jmp dicemal

        cien8:
        CMP al,56 ; 8
        jne cien9
        print pirntd 
        print pirntc 
        print pirntc 
        print pirntc 
        jmp dicemal

        cien9:
        CMP al,57 ; 9
        print pirntc
        print pirntm   
        jmp dicemal


        jmp exit

;################################################################ decenas ###########################################3
        masdies:


        CMP al,49 ; 1
        JNE dies2
        print pirntx

        JMP unidad

        dies2:
        CMP al,50 ; 2
        JNE dies3
        print pirntx
        print pirntx
        JMP unidad

        dies3:
        CMP al,51 ; 3
        JNE dies4
        print pirntx
        print pirntx
        print pirntx
        JMP unidad

        dies4:
        CMP al,52 ; 4
        JNE dies5
        print pirntx    
        print pirnt50 
        JMP unidad

        dies5:
        CMP al,53 ; 5
        JNE dies6
        print pirnt50
        JMP unidad

        dies6:
        CMP al,54 ; 6
        JNE dies7
        print pirnt50
        print pirntx
        JMP unidad

        dies7:
        CMP al,55 ; 7
        JNE dies8
        print pirnt50
        print pirntx
        print pirntx
        JMP unidad

        dies8:
        CMP al,56 ; 8
        JNE dies9
        print pirnt50
        print pirntx
        print pirntx
        print pirntx
        JMP unidad

        dies9:
        CMP al,57 ; 9
        print pirntx
        print pirntc 
        JMP unidad

        
        jmp exit

;################################################################# UNIDADES ########################################################

        esDecimal:
        CMP al,49 ; 1
        JNE UNIDAD2 
        PRINT pirnti 
        JMP exit
        UNIDAD2:
        CMP al,50 ; 2
        JNE UNIDAD3
        PRINT pirnti 
        PRINT pirnti
        JMP exit
        UNIDAD3:
        CMP al,51 ; 3
        JNE UNIDAD4 
        PRINT pirnti 
        PRINT pirnti
        PRINT pirnti
        JMP exit
        UNIDAD4:
        CMP al,52 ; 4
        JNE UNIDAD5 
        PRINT pirnti
        PRINT pirntv 
        JMP exit
        UNIDAD5:
        CMP al,53 ; 5
        JNE UNIDAD6 
        PRINT pirntv 
        JMP exit
        UNIDAD6:
        CMP al,54 ; 6
        JNE UNIDAD7
        PRINT pirntv 
        PRINT pirnti
        JMP exit
        UNIDAD7:
        CMP al,55 ; 7
        JNE UNIDAD8 
        PRINT pirntv 
        PRINT pirnti
        PRINT pirnti
        JMP exit
        UNIDAD8:
        CMP al,56 ; 8
        JNE UNIDAD9 
        PRINT pirntv 
        PRINT pirnti
        PRINT pirnti
        PRINT pirnti
        JMP exit
        UNIDAD9:
        CMP al,57 ; 9
        PRINT pirnti 
        PRINT pirntx 
        jmp exit

exit:
pop si
pop cx
pop bx
pop ax

endm


;----------------------------------------------------------------------------------------------------------------------------------------

.model small


;----------------SEGMENTO DE PILA---------------------

.stack 100h


;----------------SEGMENTO DE DATO---------------------

.data
msjEntrada db 0ah, 0dh, 'Universidad de San Carlos de Guatemala',0ah, 0dh, 'Facultad de Ingenieria',0ah, 0dh,'Arquitectura de Ensambladores y Computadoras A', 0ah, 0dh, 'Segundo Semestre 2021' , 0ah, 0dh,'Examen Final de Laboratorio', 0ah, 0dh, 'CESAR LEONEL CHAMALE SICAN' , 0ah, 0dh,'CARNET: 201700634', '$'

salto db 0ah,0dh, '$' ,'$'

msjingrese db 0ah, 0dh, 'INGRESE EL NUMERO A CONVERTIR: ej: 0035, 1245, 0003, 3999','$'


lineaSep db 0ah,0dh, '---------------------------------------------------------------------' ,'$'

textoIngre db 0,'$'
;------------------------------- LETRAS DE NUMEROS ROMANOS -------------------------------------------
lineaSep2 db 0ah,0dh, '---------------------------------------------------------------------' ,'$' ; no elimiar esta linea, POR ALGUNA RAZON NO IMPRIMO EL VALOR DE LA VARIABLE QUE ESTE DEBAJO SI ESTA OTRA VARIABLE, COMO ESTA POR EJEMPLO... EL PROBLEMA SE ORIGINA EN LA MACRO DE OBTENERTEXTO
pirnti db 'I', '$'

pirntv db 'V', '$'


pirntx db 'X', '$'

pirnt50 db 'L', '$'

pirntc db 'C', '$'

pirntd db 'D', '$'

pirntm db 'M', '$'



;----------------SEGMENTO DE CODIGO--------------------

.code

main proc
        mov ax,@data    
        mov ds,ax
        Menu:
        ;ENTRADA DE PROGRAMA
                print msjEntrada
                print salto 
                print lineaSep
        CICLO:
                print msjingrese
                print salto 
                obtenerTexto textoIngre
                print salto 
                AnalizarNumero textoIngre
                print salto 
        JMP CICLO


        Salir:
                close


main endp
end main