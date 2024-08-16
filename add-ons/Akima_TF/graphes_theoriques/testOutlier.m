% Fonction à interpoler (fonction de Runge)
runge_function = @(x) 1 ./ (1 + 25 * x.^2);

% Points pour l'interpolation
x_interpolation = linspace(1, 10, 1000);

x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
y_without_outlier = [10, 20, 4, 15, 25, 30, 37, 22, 15, 4];
y_with_outlier = [10, 20, 4, 15, 25, 3, 37, 22, 15, 4];

% Nombre de points de données pour l'interpolation
num_points = [5, 15];

figure;
    
    % Interpolation linéaire par morceaux
    y_interpolation_linear1 = interp1(x, y_without_outlier, x_interpolation, 'linear');
    
    % Interpolation Spline Cubique
    y_interpolation_spline1 = interp1(x, y_without_outlier, x_interpolation, 'spline');
    
    % Interpolation Makima
    y_interpolation_makima1 = interp1(x, y_without_outlier, x_interpolation, 'makima');
    
    % Plot
    subplot(2, 1, 1);
    plot(x_interpolation, y_interpolation_linear1, 'b-', 'DisplayName', 'I. Linéaire par morceaux','LineWidth',1.5);
    hold on;
    plot(x_interpolation, y_interpolation_spline1, 'r:', 'DisplayName', 'I. Spline Cubique','LineWidth',1.5);
    plot(x_interpolation, y_interpolation_makima1, 'k--', 'DisplayName', 'I. Makima','LineWidth',1.5);
    title(['Interpolations sans outlier'], 'FontSize', 14);
    xlabel('x', 'FontSize', 12);
    ylabel('y', 'FontSize', 12);
    legend('Location', 'northeast');
    grid on;
    hold off;


    % Interpolation linéaire par morceaux
    y_interpolation_linear2 = interp1(x, y_with_outlier, x_interpolation, 'linear');
    
    % Interpolation Spline Cubique
    y_interpolation_spline2 = interp1(x, y_with_outlier, x_interpolation, 'spline');
    
    % Interpolation Makima
    y_interpolation_makima2 = interp1(x, y_with_outlier, x_interpolation, 'makima');
    
    % Plot
    subplot(2, 1, 2);
    plot(x_interpolation, y_interpolation_linear2, 'b-', 'DisplayName', 'I. Linéaire par morceaux','LineWidth',1.5);
    hold on;
    plot(x_interpolation, y_interpolation_spline2, 'r:', 'DisplayName', 'I. Spline Cubique','LineWidth',1.5);
    plot(x_interpolation, y_interpolation_makima2, 'k--', 'DisplayName', 'I. Makima','LineWidth',1.5);
    title(['Interpolations avec outlier en x = 6'], 'FontSize', 14);
    xlabel('x', 'FontSize', 12);
    ylabel('y', 'FontSize', 12);
    legend('Location', 'northeast');
    grid on;
    hold off;

% Ajuster la disposition des graphes
set(gcf, 'Position', [300, 300, 400, 400]); % Taille de la figure
