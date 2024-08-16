% Fonction à interpoler (fonction de Runge)
runge_function = @(x) 1 ./ (1 + 25 * x.^2);

% Points pour l'interpolation
x_interpolation = linspace(-1, 1, 1000);

% Nombre de points de données pour l'interpolation
num = 10;

figure;
    
% Génération des points de données uniformes
x_unif = linspace(-1, 1, num);
y_unif = runge_function(x_unif);

% Interpolation avec Lagrange (utilisation de polyfit et polyval)
poly_coeffs = polyfit(x_unif, y_unif, num-1);
y_interpolation_lagrange = polyval(poly_coeffs, x_interpolation);

% Interpolation linéaire par morceaux
y_interpolation_linear = interp1(x_unif, y_unif, x_interpolation, 'linear');

% Interpolation Spline Cubique
y_interpolation_spline = interp1(x_unif, y_unif, x_interpolation, 'spline');

% Interpolation Makima
y_interpolation_makima = interp1(x_unif, y_unif, x_interpolation, 'makima');

% Plot
subplot(2, 1, 1);
plot(x_interpolation, y_interpolation_lagrange, 'r', 'DisplayName', 'I. Lagrange','LineWidth',1.5);
hold on;
plot(x_interpolation, y_interpolation_linear, 'g-', 'DisplayName', 'I. Linéaire par morceaux','LineWidth',1.5);
plot(x_interpolation, y_interpolation_spline, 'y:', 'DisplayName', 'I. Spline Cubique','LineWidth',1.5);
plot(x_interpolation, y_interpolation_makima, 'k--', 'DisplayName', 'I. Makima','LineWidth',1.5);
xlim([-1 1]);
ylim([-0.5 1]);
scatter(x_unif, y_unif, 'filled', 'DisplayName', 'Données');
title(['Interpolations avec noeuds équidistants'], 'FontSize', 14);
xlabel('x', 'FontSize', 12);
ylabel('y', 'FontSize', 12);
legend('Location', 'northeast');
grid on;
hold off;

% Génération des points de données non uniformes
x = [-1,-0.95, -0.65, -0.4, -0.15, 0.15, 0.4, 0.65, 0.95,1];
y = runge_function(x);

% Interpolation avec Lagrange (utilisation de polyfit et polyval)
poly_coeffs_2 = polyfit(x, y, num-1);
y_interpolation_lagrange_2 = polyval(poly_coeffs_2, x_interpolation);

% Interpolation linéaire par morceaux
y_interpolation_linear_2 = interp1(x, y, x_interpolation, 'linear');

% Interpolation Spline Cubique
y_interpolation_spline_2 = interp1(x, y, x_interpolation, 'spline');

% Interpolation Makima
y_interpolation_makima_2 = interp1(x, y, x_interpolation, 'makima');

% Plot
subplot(2, 1, 2);
plot(x_interpolation, y_interpolation_lagrange_2, 'r', 'DisplayName', 'I. Lagrange','LineWidth',1.5);
hold on;
plot(x_interpolation, y_interpolation_linear_2, 'g-', 'DisplayName', 'I. Linéaire par morceaux','LineWidth',1.5);
plot(x_interpolation, y_interpolation_spline_2, 'y:', 'DisplayName', 'I. Spline Cubique','LineWidth',1.5);
plot(x_interpolation, y_interpolation_makima_2, 'k--', 'DisplayName', 'I. Makima','LineWidth',1.5);
xlim([-1 1]);
ylim([-0.5 1]);
scatter(x, y, 'filled', 'DisplayName', 'Données');
title(['Interpolations avec noeuds non-équidistants'], 'FontSize', 14);
xlabel('x', 'FontSize', 12);
ylabel('y', 'FontSize', 12);
legend('Location', 'northeast');
grid on;
hold off;

% Ajuster la disposition des graphes
set(gcf, 'Position', [300, 300, 400, 400]); % Taille de la figure
