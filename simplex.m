function[coef_rest, X, Z] = simplex(coefs, coef_rest, vetor_s);
% Laboratorio 4 - PO1 - Simplex
%
% variaveis de entrada
% coefs = coeficientes das variaveis da funcao Z
% coef_rest - coeficientes das restricoes
% vetor_s - vetor de valores de limite das restricoes
%
% variaveis de saida
% coef_rest - tableu final
% X - os valores de x que maximizam a funcao
% Z - o valor da funcao objetivo
% ajustes basicos
coefs = -coefs;
[m, n] = size(coef_rest);
coef_rest = [coef_rest eye(m)];
vetor_s = vetor_s(:);
coefs = coefs(:)';
coef_rest = [coef_rest vetor_s];
d = [coefs zeros(1,m+1)];
coef_rest = [d;coef_rest];
% imprimir o coef_rest inicial 
coef_rest
% pegando o mais negativo, caso exista
s = coef_rest(1,1:m+n);
ind = find(s < 0)
if ~isempty(ind)
    [menor col] = min(s);
else
    menor = [];
    col = [];
end
coefs_finais = n+1:m+n;
% laco principal do algoritmo
while ~isempty(menor) && menor < 0
    t = coef_rest(2:m+1,col);
    if all(t <= 0)
        % Sem solucao
        X = zeros(n,1);
        Z = inf;
        return;    	
    end
    m = length(coef_rest(2:m+1,m+n+1));
    coefs = 2:m+1;
    a = coef_rest(2:m+1,m+n+1);
    vetor_s = coef_rest(2:m+1,col);
    l = (coefs(vetor_s > 0));
    [menor, linha] = min(a(l-1)./vetor_s(l-1));
    % debugar e contar os lacos menor    
    linha = l(linha)
    if ~isempty(linha)
        coef_rest(linha,:)= coef_rest(linha,:)/coef_rest(linha,col);
        coefs_finais(linha) = col;
        for i = 1:m+1
            if i ~= linha
                coef_rest(i,:)= coef_rest(i,:)-coef_rest(i,col)*coef_rest(linha,:);
            end
        end
    end
    coef_rest
    s = coef_rest(1,1:m+n);
    ind = find(s < 0);
    if ~isempty(ind)
        [menor col] = min(s);
    end
end

