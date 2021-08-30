%{
        _______________________________________________________
        #####################################################
            SIMULACION PROYECTO DE GRADO CASOS COVID-19
                        EMPLEANDO METODO DMD
        _____________________________________________________
        #####################################################
                  Descomposicion en Modos Dinamicos
        _____________________________________________________
        #####################################################

                             Autores:
                    Fabian David Navarro Cano.
                       Abel Alvarez Bustos.
%}

%% Metodo de Descomposicion en Modos Dinamicos

function [Phi, Lambda, b] = DMD(X,Xprime,r)
[U,Sigma,V] = svd(X,'econ');
Ur = U(:,1:r);
Sigmar = Sigma(1:r,1:r);
Vr = V(:,1:r);
Atilde = Ur'*Xprime*Vr/Sigmar;
[W,Lambda] = eig(Atilde);
Phi = Xprime*(Vr/Sigmar)*W;
alpha1 = Sigmar*Vr(1,:)';
b = (W*Lambda)\alpha1;
