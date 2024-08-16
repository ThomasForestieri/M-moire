% Points donnés
x = [-1, -0.5, 0, 0.5, 1];
y = [1.5, 1, 0, 1, 0.5];

%x = 0:15;
%y = besselj(1,x);
%xq = 0:0.01:15;

% Nouveau vecteur x pour l'interpolation
xq = linspace(min(x), max(x), 100); % 100 points interpolés

% Interpolation linéaire
yq1 = interp1(x, y, xq, 'spline');
%yq2 = interp1(x, y, xq, 'linear');
yq2 = akima(x, y, xq);
yq3 = interp1(x, y, xq, 'makima');

% Tracer les points originaux
plot(x, y, 'o', 'MarkerFaceColor', 'r');
hold on;

% Tracer la courbe interpolée
plot(xq,yq1, xq,yq2,'--',xq,yq3,'-b')
%plot( xq,yq2,'--',xq,yq3,'-b')

% Ajouter des labels et une légende
xlabel('x');
ylabel('y');
title("Comparaison des méthodes d'interpolation");
legend ('Points originaux' ,'Interpolation spline cubique' ,'Interpolation linéaire', "Interpolation Makima" );
%legend('Points originaux', "Interpolation d'Akima");
%legend('Points originaux', 'Interpolation spline cubique');
%legend('Points originaux', 'Interpolation linéaire');
%legend('Points originaux', "Interpolation d'Akima", "Interpolation Makima");


% Afficher la grille
grid on;

% Maintenir la figure
hold off;