%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado masculino: Homem -> {V,F}

masculino(joao).
masculino(jose).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado feminino: Mulher -> {V,F}

feminino(maria).
feminino(joana).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).
filho( filipe,paulo ).
filho( maria, paulo).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :-
    filho( F,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A, N) :-
    pai( A,X ), filho( N,X ).

avo( antonio,nadia ).
avo( ana,nuno ).

% Extensao do predicado neto: Neto,Avo -> {V,F}

neto( N,A ) :-
    avo( A,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo( BA,BN ) :-
    avo( BA,P ), filho( BN,P ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente( DS,AS ) :-
    bisavo( AS,DS ), avo( AS,DS ), pai( AS,DS ).





%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}





