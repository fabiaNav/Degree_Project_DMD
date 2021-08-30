%{
        _______________________________________________________
        #####################################################
            SIMULACION PROYECTO DE GRADO CASOS COVID-19
                        EMPLEANDO METODO DMD
        _____________________________________________________
        #####################################################
                Ejecucion e Implementacion del modelo
        _____________________________________________________
        #####################################################

                             Autores:
                    Fabian David Navarro Cano.
                       Abel Alvarez Bustos.
%}

%% Metodo de Descomposicion en Valores singulares economico.

[U,S,V]=svd(X,'econ');
LA= diag(S);

%% Grafica por Snapshots para la creacion del mapa de calor.

figure(2)
colormap('turbo');
imagesc(X);
colorbar;
title('Snapshots de los contagiados por semana')
ylabel('Comunas')
xlabel('Semanas')

%% Grafica de los autovalores de la matriz completa (Autovalores del PCA).

for te=1:length(LA)
    Tvalor(te)=sum(LA(1:te))/sum(LA);
end

figure(3)
plot(Tvalor,'.k','MarkerSize', 20)
title('Aporte de los n primeros valores singulares (\Sigma)')
ylabel('Valores singulares')
xlabel('Comunas')
grid on

%% Ejecucion del metodo Descomposicion en Modos Dinamicos.

[Phi, Lambda, b] = DMD(X(:,1:end-1),X(:,2:end),16);

%% Grafica del circulo unitoria y sus autovalores(descomposicion espectral)

figure(4)
hold on 
t=0:0.01:2*pi;
plot(exp(i*t),'k','LineWidth',1.4);
axis([-1.2 1.2 -1.2 1.2])
plot(diag(Lambda),'.r','MarkerSize', 20)
title('Descomposicion  Espectral')
hold off

%% Grafica que presenta los aportes a las magnitudes de Contagio.

figure(5)
a=Phi(:,8);
ar=real(Phi(:,8));
ai=imag(Phi(:,8));
at=ar.^2+ai.^2;
plot(at,'.k','MarkerSize', 20)
title('Representacion de contagio asociado a la mayor magnitud vectorial')
xlabel('Comuna')
ylabel('Magnitud de contagio en cada comuna')
grid on

%% Grafica de los modos de Oscilacion segun sus autovalores (Frecuencia).

figure(6)
dt= 1/56;
freq = abs((imag(log(diag(Lambda))))/(2*pi*dt));
fq = stem(freq, 'filled','k','LineWidth',1.4);
fq.MarkerFaceColor = 'r';
axis([0 17 0 29])
title('Representacion de la frecuencia de contagio en el Covid19')
xlabel('Autovalores')

%% Grafica que presenta los aportes a la frecuencia de contagio.

figure(7)
a=Phi(:,1);
arf=real(Phi(:,1));
aif=imag(Phi(:,1));
atf=arf.^2+aif.^2;
plot(atf,'.k','MarkerSize', 20)
title({'Representacion de contagio asociado';
    'a la mayor oscilacion de la frecuencia'})
xlabel('Comuna')
ylabel('Frecuencia de contagio en cada comuna')
grid on