I1 = imread('image1.png'); % Image fixe
I2 = imread('image2.png'); % Image à recaler

% Configuration de la transformation et de la mesure de similarité
trafo('reset','rigid2D');
distance('reset','SSD');

% Définir l'interpolation Makima
interpolationMethod = 'makima';

% Configuration de l'optimiseur et recalage
[yc, wc, his] = NPIR(I1, I2, 'trafo', 'rigid2D', 'distance', 'SSD', 'interpolation', interpolationMethod);

% Affichage des résultats
viewImage(2, I2, omega, m); hold on;
plotGrid(wc, omega, m);