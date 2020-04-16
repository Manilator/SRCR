% SIST. REPR. CONHECIMENTO E RACIOCINIO - MIEI/3

% FICHA 9

% FLAGS

:- set_prolog_flag(discontiguous_warnings,off).
:- set_prolog_flag(single_var_warnings,off).
:- set_prolog_flag(unknown,fail).

% Como representar um grafo

g(grafo([a,b,c,d,e,f,g], [a(a,b),a(c,f),a(c,d),a(d,f),a(f,g)])).

adjacente(X,Y,grafo(_,Es)) :- member(aresta(X,Y), Es).
adjacente(X,Y,grafo(_,Es)) :- member(aresta(Y,X), Es).

caminho(G,X,Y,P) :- caminho(G,X,[Y],P).

caminhoAux(_,X.[X|T],[X|T]).
caminhoAux(_,X.[X|T],P) :-
    adjacente(Prox_nodo, Y, G), nao(member(Prox_nodo,[Y|T]), caminhoAux(G,X,[Prox_nodo,Y|T],P)).

ciclo(G,X,P) :-
    adjacente(Prox_nodo, X, G), caminho(G, Prox_nodo, X, P1), length(P1, L), L > 2, append(P1,[X],P).