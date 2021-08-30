%{
        _______________________________________________________
        #####################################################
            SIMULACION PROYECTO DE GRADO CASOS COVID-19
                        EMPLEANDO METODO DMD
        _____________________________________________________
        #####################################################
             Organizacion y limpieza de la base de datos
        _____________________________________________________
        #####################################################

                             Autores:
                    Fabian David Navarro Cano.
                       Abel Alvarez Bustos.
%}

%% Proceso de organizacion y normalizacion de la base de datos

for k=1:tam(1)
    for j=1:tam(2)
        X(j,k)= Covid(k,j);
    end
end

X= table2array(X);

% Estadisticas Basicas
Comuna = [1:1:tam(2)]';
semanas = (ones(1,tam(2))*tam(1))';
mean_Covid = mean(X')';
std_Covid = std(X')';
min_Covid = min(X')';
max_Covid = max(X')';

T = table(Comuna, semanas, mean_Covid, std_Covid, min_Covid, max_Covid)

% Boxplot por comunas
figure(1)
fb = boxchart(X')
fb.MarkerStyle = "*";
fb.MarkerColor = '#FF0000';
fb.WhiskerLineColor = '#000000';
fb.LineWidth = 1.4;

title('Analisis basico del Covid19')
xlabel('Comunas')
ylabel('contagiados por comuna')

% Normalizacion de la matriz
MX= mean(X,2);
X=X-MX;