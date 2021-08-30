%{
        _______________________________________________________
        #####################################################
            SIMULACION PROYECTO DE GRADO CASOS DENGUE
                        EMPLEANDO METODO DMD
        _____________________________________________________
        #####################################################
                               MAIN
        _____________________________________________________
        #####################################################
                             Autores:
                    Fabian David Navarro Cano.
                       Abel Alvarez Bustos.
%}

clc
clear all
close all
warning('off','all')

%% Carga de la base de datos.

Upload_data_Dengue

%% Organizacion y limpieza de la base de datos.

Organization_data_Dengue

%% Ejecucion e Implementacion del modelo.

Execution_model_Dengue