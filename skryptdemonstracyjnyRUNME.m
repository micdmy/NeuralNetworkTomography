%SKRYPT DEMONSTACYJNY

% Uczenie sieci dla metody pojedynczego piksela
% wykonujemy w skrypcie applications/networkTrainingSinglePixel.m
% trzeba w nim ustawic 4 zmienne:
% name, trainFraction, numPixels, hiddenLayersSizes
% ich znaczecie jest wyjasnione w skrypcie
% po treningu sieci, tworzony jest plik [nazwa]PixResults.mat

% Uczenie sieci dla metody bezpoœredniej
% wykonujemy w skrypcie applications/networktraining.m
% trzeba w nim ustawic 3 zmienne:
% name, trainFraction, hiddenLayersSizes

% Do generowania ograzów ich transformat (zbiorow uczacych)
% nalezy uzyc funkcji
% imgGenerator1Ellipses.m - generuje elipsy
% i skryptu: imgGeneratorTestSet.m - generuje inne obrazy uzywane do
% testowania sieci

% Testowanie sieci mozna wykonac uruchamiajac funkcje:
% verifyResults(name, testImagesName, isWhole, isPixel)
% name - nazwa pliku z wynikami uczenia i siecia
% testImagesName - nazwa pliku z obrazami na ktorych bedziemy testowac siec
% isWhole - istnieje plik z wynikami uczenia i siecia dla metody
%           bezposredniej
% isPixel - istnieje plik z wynikami uczenia i siecia dla metody
%       pojedynczego piksela
%wpisujac numer obrazu w konsoli, przechodzimy do wyswietlenia wynikow dla
%obrazu o tym numerze

% przyklad:
verifyResults('Ellipse2x10y10n200','Ellipse2x10y10n200',true,true)
