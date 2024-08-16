% Fonction à interpoler (fonction de Runge)
runge_function = @(x) 1 ./ (1 + 25 * x.^2);

% Points pour l'interpolation
x_interpolation = linspace(-1, 1, 1000);

% Nombre de points de données pour l'interpolation
num_points = [5, 15];

figure;

for i = 1:length(num_points)
    num = num_points(i);
    
    % Génération des points de données
    x = linspace(-1, 1, num);
    y = runge_function(x);
    
    % Interpolation avec Lagrange (utilisation de polyfit et polyval)
    poly_coeffs = polyfit(x, y, num-1);
    y_interpolation_lagrange = polyval(poly_coeffs, x_interpolation);
    
    % Interpolation linéaire par morceaux
    y_interpolation_linear = interp1(x, y, x_interpolation, 'linear');
    
    % Interpolation Spline Cubique
    y_interpolation_spline = interp1(x, y, x_interpolation, 'spline');
    
    % Interpolation Makima
    y_interpolation_makima = interp1(x, y, x_interpolation, 'makima');
    
    % Plot
    subplot(3, 1, i);
    plot(x_interpolation, runge_function(x_interpolation), 'b', 'DisplayName', 'Fonction de Runge','LineWidth',1.5);
    hold on;
    plot(x_interpolation, y_interpolation_lagrange, 'r', 'DisplayName', 'I. Lagrange','LineWidth',1.5);
    plot(x_interpolation, y_interpolation_linear, 'g-', 'DisplayName', 'I. Linéaire par morceaux','LineWidth',1.5);
    plot(x_interpolation, y_interpolation_spline, 'y:', 'DisplayName', 'I. Spline Cubique','LineWidth',1.5);
    plot(x_interpolation, y_interpolation_makima, 'k--', 'DisplayName', 'I. Makima','LineWidth',1.5);
    scatter(x, y, 'filled', 'DisplayName', 'Données');
    title(['Interpolations avec ' num2str(num) ' données'], 'FontSize', 14);
    xlabel('x', 'FontSize', 12);
    ylabel('y', 'FontSize', 12);
    legend('Location', 'northeast');
    grid on;
    hold off;
end

subplot(3, 1, 3);
    plot(x_interpolation, runge_function(x_interpolation), 'b', 'DisplayName', 'Fonction de Runge','LineWidth',1.5);
    hold on;
    plot(x_interpolation, y_interpolation_linear, 'g-', 'DisplayName', 'I. Linéaire par morceaux','LineWidth',1.5);
    plot(x_interpolation, y_interpolation_spline, 'y:', 'DisplayName', 'I. Spline Cubique','LineWidth',1.5);
    plot(x_interpolation, y_interpolation_makima, 'k--', 'DisplayName', 'I. Makima','LineWidth',1.5);
    scatter(x, y, 'filled', 'DisplayName', 'Données');
    title(['Interpolations avec 15 données sans Lagrange'], 'FontSize', 14);
    xlabel('x', 'FontSize', 12);
    ylabel('y', 'FontSize', 12);
    legend('Location', 'northeast');
    grid on;
    hold off;

% Ajuster la disposition des graphes
set(gcf, 'Position', [300, 300, 400, 400]); % Taille de la figure
