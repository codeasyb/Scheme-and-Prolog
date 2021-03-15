male(me).
male(my-dad).
male(baby-boy).
male(my-dad-son).

female(widow).
female(widow-daughter).

husband(me, widow).
husband(my-dad, widow-daughter).
wife(X, Y) :- husband(Y, X).

father(me, baby-boy).
father(my-dad, me).
father(my-dad, my-dad-son).

mother(widow, baby-boy).
mother(widow, widow-daughter).
mother(widow-daughter, my-dad-son).
mother(G,I):-father(D,I),married(D,G).
       
son(baby-boy,me).
son(me,my-dad).
son(my-dad-son,my-dad).
son(baby-boy,widow).
son(my-dad-son,widow-daughter).
  
married(X, Y) :- husband(X, Y).
married(X, Y) :- wife(X, Y).

daughter(widow-daughter,widow).
daughter(G,I):-married(I,M),daughter(G,M).

son_in_law(D,I):-daughter(W,I),married(W,D).

parent(X, Y) :- firstParent(X, Y).
parent(X, Y) :- step_parent(X, Y).

step_parent(X, Z) :-
    married(X, Y),
    firstParent(Y, Z),
    \+ firstParent(X, Z).

firstParent(X, Y) :- father(X, Y).
firstParent(X, Y) :- mother(X, Y).

grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

grandmother(X,Z):-
  parent(X, Y),
    parent(Y, Z),
    female(X).

grandchild(X,Y):-grandfather(Y,X).
grandchild(X,Y):-grandmother(Y,X).

sibling(X, Y) :- distinct(direct_sibling(X, Y)).

sibling_in_law(X, Y) :- relation_sibling_inlaw(X, Y).
sibling_in_law(X, Y) :- relation_sibling_inlaw(Y, X).

relation_sibling_inlaw(X, Z) :-
    married(X, Y),
    sibling(Y, Z).

direct_sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

brother(X,Y):-sibling(X,Y);sibling_in_law(X,Y),male(X).

uncle(X, Z) :-
    sibling(X, Y),
    parent(Y, Z),
    male(X).

proof(ME):-
	daughter(A,ME),
	mother(A,ME),
	son_in_law(D,ME),
	uncle(E,ME),
	brother(B,D),
	brother(B,A),
	grandchild(F,ME),
	mother(C,A),
	grandmother(C,ME),
	grandchild(ME,C),
	grandfather(ME,ME).





