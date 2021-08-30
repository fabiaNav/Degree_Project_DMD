%{
        _______________________________________________________
        #####################################################
            SIMULACION PROYECTO DE GRADO CASOS DENGUE
                        EMPLEANDO METODO DMD
        _____________________________________________________
        #####################################################
                Ejecucion e implementacion del modelo
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
title('Snapshots de los infectados por Anio')
ylabel('Paises de la OPS')
xlabel('Anios')

%% Grafica de los autovalores de la matriz completa (Autovalores del PCA).

for te=1:length(LA)
    Tvalor(te)=sum(LA(1:te))/sum(LA);
end

figure(3)
plot(Tvalor,'.k','MarkerSize', 20)
title('Aporte de los n primeros valores singulares (\Sigma)')
ylabel('Valores singulares')
xlabel('Paises')
grid on

%% Ejecucion del metodo Descomposicion en Modos Dinamicos.

[Phi, Lambda, b] = DMD(X(:,1:end-1),X(:,2:end),12);

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

fig=figure(5);
a=Phi(:,1);
ar=real(Phi(:,1));
ai=imag(Phi(:,1));
at=ar.^2+ai.^2;
%-- Primer grafica para la representacion de contagio
subplot(2,1,2)
plot(at,'.k','MarkerSize', 20)
ylim([0,0.025])
xlim([0,53])
grid on
%-- Segunda grafica para la representacion de contagio
subplot(2,1,1)
plot(at,'.k','MarkerSize', 20)
ylim([0.45,1])
xlim([0,53])
grid on
xticklabels({})
ax = axes(fig);
yyaxis(ax, 'left');
han = gca;
han.Visible = 'off';
han.Title.Visible = 'on';
han.XLabel.Visible = 'on';
han.YLabel.Visible = 'on';
title('Representacion de infeccion asociado a la mayor magnitud vectorial')
xlabel('Paises de la OPS')
ylabel('Magnitudes de infeccion en cada pais')
han.YLabel.Visible = 'on';

%% Grafica de los modos de Oscilacion segun sus autovalores (Frecuencia).
figure(6)
dt= 1/41;
freq = abs((imag(log(diag(Lambda))))/(2*pi*dt));
fq = stem(freq, 'filled','k','LineWidth',1.4);
fq.MarkerFaceColor = 'r';
axis([0 13 0 16])
title('Representacion de la frecuencia de infeccion en el Dengue')
xlabel('Frecuencia')

%% Grafica que presenta los aportes a la frecuencia de contagio.

fig5=figure(7);
a=Phi(:,2);
arf=real(Phi(:,2));
aif=imag(Phi(:,2));
atf=arf.^2+aif.^2;
%-- Primer grafica para la representacion de infeccion
subplot(2,1,2)
plot(atf,'.k','MarkerSize', 20)
ylim([0,0.01])
xlim([0,53])
grid on
%-- Segunda grafica para la representacion de infeccion
subplot(2,1,1)
plot(atf,'.k','MarkerSize', 20)
ylim([0.4,0.5])
xlim([0,53])
grid on
xticklabels({})
ax = axes(fig5);
yyaxis(ax, 'left');
han = gca;
han.Visible = 'off';
han.Title.Visible = 'on';
han.XLabel.Visible = 'on';
han.YLabel.Visible = 'on';
title('Representacion de infeccion asociado a la mayor oscilaccion de la frecuencia')
xlabel('Paises de la OPS')
ylabel('Frecuencia de infeccion en cada pais')
han.YLabel.Visible = 'on';
