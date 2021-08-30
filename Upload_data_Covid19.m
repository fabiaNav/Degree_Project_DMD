%{
        _______________________________________________________
        #####################################################
            SIMULACION PROYECTO DE GRADO CASOS COVID-19
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

Covid = readtable("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/Covid19Cali.csv",'Range','C2:X57');
tam= size(Covid);