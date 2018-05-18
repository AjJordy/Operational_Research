function B = permut(A,i,j)
% Permut: Troca linhas de uma matriz A
% com a matriz de permutação
% B = permut(A,11,12)
% entrada:
% A = matriz original
% 11, 12 = linhas a serem permutadas
% saída:
% B = matriz com as linhas trocadas
[m,n] = size(A);
Aux = [1,n];
if m<i || m<j , error('Numero de linhas invalida');end
if i<0 || j<0 , error('Valor negativo de linha');end
% Permutação das linhas
for k = 1:n
    Aux(1,k) = A(i,k);
    A(i,k) = A(j,k);
    A(j,k) = Aux(1,k);
end;
