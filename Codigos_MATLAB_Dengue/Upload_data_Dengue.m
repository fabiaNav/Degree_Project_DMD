%{
        _______________________________________________________
        #####################################################
            SIMULACION PROYECTO DE GRADO CASOS DENGUE
                        EMPLEANDO METODO DMD
        _____________________________________________________
        #####################################################
                     Carga de la base de datos
        _____________________________________________________
        #####################################################
                             Autores:
                    Fabian David Navarro Cano.
                       Abel Alvarez Bustos.
%}

%% Funcion de captura de datos

Americas = readtable("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/DengueAmericas.csv",'Range','C2:AQ53');
tam= size(Americas);