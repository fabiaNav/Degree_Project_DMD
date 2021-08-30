%{
        _______________________________________________________
        #####################################################
            SIMULACION PROYECTO DE GRADO CASOS DENGUE
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
        X(k,j)= Americas(k,j);
    end
end

X= table2array(X);

% Estadisticas Basicas
Paises = [1:1:tam(1)]';
Anios = (ones(1,tam(1))*tam(2))';
mean_Dengue = mean(X')';
std_Dengue = std(X')';
min_Dengue = min(X')';
max_Dengue = max(X')';

T = table(Paises, Anios, mean_Dengue, std_Dengue, min_Dengue, max_Dengue)

% Boxplot por comunas
figure(1)
fb = boxchart(X')
fb.MarkerStyle = "*";
fb.MarkerColor = '#FF0000';
fb.WhiskerLineColor = '#000000';
fb.LineWidth = 1.4;

title('Analisis basico del Dengue')
xlabel('Paises')
ylabel('Infectados por paises')

% Normalizacion de la matriz
MX= mean(X,2);
X=X-MX;
