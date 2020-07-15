registros = {   #Diccionario con los 8 registros escalares a utilizar.
                'Rn1':   '000',
                'Rn2':   '001',
                'Rn3':   '010',
                'Rn4':   '011',
                'Rn5':   '100',
                'Rn6':   '101',
                'Rn7':   '110',
                'Rn8':   '111'
            }
instrucciones =  { #Diccionario con las 15 instrucciones a utilizar.
                'mov': '0000',
                'inc': '0001',
                'add': '0010',
                'cmp': '0011',
                'b': '0100',
                'bnq': '0101',
                'load_8x8': '0110',
                'store_8x8': '0111',
                'mods_8x8': '1000',
                'inc_4x16': '1001',
                'norm': '1010',
                'get_8x8': '1011',
                'end': '1100'
                }

def compilador(expresion):
    oP = ""
    cond=""
    rvD=""
    rvS=""
    rnD=""
    rnSA=""
    rnSB=""
    inm=""
    if (expresion == "end"):
            comando = expresion
            oP = "1110"
            cond = "0"
            rvD = rvS = "0"
            rnD = rnSA = rnSB = "000"
            inm = 16*"0"
            resultadoFinal = oP+cond+rvD+rvS+rnD+rnSA+rnSB+inm
    else:
        i = 0
        while(expresion[i] != " "):
            i = i+1
        comando = expresion[:i]
        oP = instrucciones[comando] #Obtención del código de operacion

        cond = "1" if comando == "bnq" else "0" #Solo el "branch not equal" tiene una condición.
        
        expresion = expresion.replace(" ","")

        if (comando == "mov"): #movRnx,YY
            rvD = rvS = "0"
            rnD = registros[expresion[i:i+3]]
            rnSA = rnSB = "000"
            j = 7
            while(expresion[j] != "/"):
                j = j+1
            inm = bin(int(expresion[7:j]))[2:]
            inm = ((16-len(inm))*"0") + inm
        elif (comando == "inc"):
            rvD = rvS = "0"
            rnD = registros[expresion[i:i+3]]
            rnSA = rnSB = "000"
            inm = 16*"0"
        elif (comando == "add"):#addRnx,Rny,ZZ
            rvD = rvS = "0"
            rnD = registros[expresion[i:i+3]]
            rnSA = registros[expresion[i+4:i+7]]
            rnSB = "000"
            j = 11
            while(expresion[j] != "/"):
                j = j+1
            inm = bin(int(expresion[11:j]))[2:]
            inm = ((16-len(inm))*"0") + inm
        elif (comando == "cmp"):#cmpRnx,Rny
            rvD = rvS = "0"
            rnD = "000"
            rnSA = registros[expresion[i:i+3]]
            rnSB = registros[expresion[i+4:i+7]]
            inm = 16*"0"
        elif (comando == "b"):#b_BuildHistogram o bnq_BuildHistogram
            rvD = rvS = "0"
            rnD = rnSA = rnSB = "000"
            if(expresion[2] == "E"):
                inm = bin(41)[2:]
            else:
                if(expresion[7] == "H"): #b_BuildHistrogram
                    inm = bin(14)[2:]
                elif(expresion[7] == "l"): #b_Normalize
                    inm = bin(28)[2:]
                else: #b_BuildImg
                    inm = bin(33)[2:]
            inm = ((16-len(inm))*"0") + inm
        elif (comando == "bnq"):#b_BuildHistogram o bnq_BuildHistogram
            rvD = rvS = "0"
            rnD = rnSA = rnSB = "000"
            if(expresion[2] == "E"):
                inm = bin(41)[2:]
            else:
                if(expresion[9] == "H"): #bnq_BuildHistrogram
                    inm = bin(14)[2:]
                elif(expresion[9] == "l"): #bnq_Normalize
                    inm = bin(28)[2:]
                else: #BuildImg
                    inm = bin(33)[2:]
            inm = ((16-len(inm))*"0") + inm
        elif (comando == "load_8x8"):#load_8x8Rn1,Rv1
            rvD = "0" if expresion[12:15] == "Rv1" else "1"
            rvS = "0"
            rnD = rnSB = "000"
            rnSA = registros[expresion[8:11]]
            inm = 16*"0"
        elif (comando == "store_8x8"):#store_8x8Rn1,Rv1
            rvD = "0"
            rvS = "0" if expresion[13:16] == "Rv1" else "1"
            rnD = registros[expresion[9:12]]
            rnSA = rnSB = "000"
            inm = 16*"0"
        elif (comando == "mods_8x8"):#divs_8x8Rv1,Rv0,4
            rvD = "0" if expresion[8:11] == "Rv1" else "1"
            rvS = "0" if expresion[12:15] == "Rv1" else "1"
            rnD = rnSA = rnSB = "000"
            j = 16
            while(expresion[j] != "/"):
                j = j+1
            inm = bin(int(expresion[16:j]))[2:]
            inm = ((16-len(inm))*"0") + inm
        elif (comando == "inc_4x16"):#inc_4x16Rv1,4
            rvD = "0"
            rvS = "0" if expresion[7:10] == "Rv1" else "1"
            rnD = rnSA = rnSB = "000"
            j = 12
            while(expresion[j] != "/"):
                j = j+1
            inm = bin(int(expresion[12:j]))[2:]
            inm = ((16-len(inm))*"0") + inm
        elif (comando == "norm"):#normRn4,Rn4
            rvD = rvS = "0"
            rnD = registros[expresion[4:7]]
            rnSA = registros[expresion[8:11]]
            rnSB = "000"
            inm = 16*"0"
        else:#get_8x8Rv1,Rv2
            rvD = "0" if expresion[7:10] == "Rv1" else "1"
            rvS = "0" if expresion[11:13] == "Rv1" else "1"
            rnD = rnSA = rnSB = "000"
            inm = 16*"0"
        resultadoFinal = oP+cond+rvD+rvS+rnD+rnSA+rnSB+inm

    file = open("Resultado.txt","r")
    if (file.readline() == ""): #Si el documento está vacío, no le añade un espacio al inicio.
        file.close()
        file = open("Resultado.txt","a")
        file.write(resultadoFinal)  #Se añade la primera instrucción.
    else:
        file.close()
        file = open("Resultado.txt","a")
        file.write("\n" + resultadoFinal)   #Si el documento no está vacío se hace un salto de línea y se añade la nueva instrucción.
    file.close()            

    #print(oP+cond+rvD+rvS+rnD+rnSA+rnSB+inm)
    

file = open("asmcode.txt", "r") #Se toma el código ensamblador y se itera a través de sus líneas para llamar al método de compilación.
for x in file:
    if (x[0] != "_" and x[0] != "#" and x != ""): #Si se topa con una etiqueta, no se manda al método de compilación.
        compilador(x)
file.close()
