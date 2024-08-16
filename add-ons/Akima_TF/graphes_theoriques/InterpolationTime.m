clear
clc

%%
% Definir differentes tailles de donnees a tester
nombre_points = [5, 10, 20, 40, 100];
nombre_query_points = [1, 10, 100];

% Initialiser les matrices pour stocker les points de donnees et les points de requete
x = zeros(length(nombre_points), max(nombre_points));
y = zeros(length(nombre_points), max(nombre_points));
query_points_asc = zeros(length(nombre_query_points), max(nombre_query_points));
query_points_rand = zeros(length(nombre_query_points), max(nombre_query_points));

% Determination des datas points  et query points
for i = 1:length(nombre_points)
    n = nombre_points(i);
    x(i, 1:n) = linspace(0, 10, n);
    y(i, 1:n) = rand(1, n);  % Generer des valeurs de y aleatoires pour les tests
    
    for j = 1:length(nombre_query_points)
        query_count = nombre_query_points(j);
        % Points de requete dans un ordre aleatoire
        query_points_rand(j, 1:query_count) = rand(1, query_count) * 10;
        % Points de requete dans l'ordre croissant
        query_points_asc(j, 1:query_count) = sort(query_points_rand(j, 1:query_count));
    end
end

%%
% Interpolation des donnees
for i = 1:length(nombre_points)
    n = nombre_points(i);
    
    % Recuperer les points de donnees pour cette taille
    x_data = x(i, 1:n);
    y_data = y(i, 1:n);
    
    fprintf('Nombre de points: %d\n', n);
    
    % Interpolation pour chaque nombre de points de requete
    nb_ite = 100;
    temps_splines_cubiques_asc = 0;
    temps_splines_cubiques_rand = 0;
    temps_akima_asc = 0;
    temps_akima_rand = 0;
    
    for j = 1:length(nombre_query_points)
        for ite = 1:nb_ite
            query_count = nombre_query_points(j);

            % Recuperer les points de requete pour cette taille
            query_points_asc_this = query_points_asc(j, 1:query_count);
            query_points_rand_this = query_points_rand(j, 1:query_count);

            % Interpolation par spline cubique (ordre croissant)
            tic;
            splines_cubiques_asc = interp1(x_data, y_data, query_points_asc_this, 'spline');
            temps_splines_cubiques_asc = temps_splines_cubiques_asc + toc * 1000;

            % Interpolation par spline cubique (ordre aleatoire)
            tic;
            splines_cubiques_rand = interp1(x_data, y_data, query_points_rand_this, 'spline');
            temps_splines_cubiques_rand = temps_splines_cubiques_rand + toc * 1000;

            % Interpolation par Akima (ordre croissant)
            tic;
            akima_asc = interp1(x_data, y_data, query_points_asc_this, 'makima');
            temps_akima_asc = temps_akima_asc + toc * 1000;

            % Interpolation par Akima (ordre aleatoire)
            tic;
            akima_rand = interp1(x_data, y_data, query_points_rand_this, 'makima');
            temps_akima_rand = temps_akima_rand + toc * 1000;
        end
    
    % Afficher les resultats moyens
    fprintf('   Nombre de points de requete: %d\n', query_count);
    fprintf('      Temps d''execution splines cubiques (ordre croissant): %.6f millisecondes\n', temps_splines_cubiques_asc/nb_ite);
    fprintf('      Temps d''execution splines cubiques (ordre aleatoire): %.6f millisecondes\n', temps_splines_cubiques_rand/nb_ite);
    fprintf('      Temps d''execution Akima (ordre croissant): %.6f millisecondes\n', temps_akima_asc/nb_ite);
    fprintf('      Temps d''execution Akima (ordre aleatoire): %.6f millisecondes\n', temps_akima_rand/nb_ite);
    fprintf('\n');
    
    end
end