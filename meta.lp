%%%
%%%  ACTION THEORY 
%%%

#external nbstep .

step(1..nbstep).

% Action choice
1 {occ(A,T): action(A)} 1 :- step(T).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%         FLUENTS                  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialisation
holds(F,V,0) :- init(F,V).

% precondition check
:- occ(A,T), precond(A,F,V), not holds(F,V,T-1).

% effects
holds(F,V,T):- occ(A,T), effect(A,F,V).

% Inertia
holds(F,V,T) :- not holds(F,N,T): value(F,N), N!=V; holds(F,V,T-1); step(T).

% force new matrix to be the next not used. 
:- holds(exists(data(M)),true,T), not holds(exists(data(N)),true,T), M=N+1, M>1.  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%        PROPERTIES                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Default properties 
%has(P,V,M) :- not has(P,W,M): value(P,W), W!=V; holds(exists(data(M)),true,_); default(P,V).

% Heredity
gen(M,O,T) :- occ(A,T); generate(A,M,O).

%holds(property(P,D2),V,T) :- holds(property(P,D1),V,T-1); heredit(P); not holds(property(P,D2),W,T): propvalue(P,W), V!=W; gen(D1,D2,T).
here(property(P,D2),V,T) :- holds(property(P,D1),V,T-1); heredit(P); not holds(property(P,D2),W,T): propvalue(P,W), V!=W; gen(D1,D2,T).

holds(property(P,D2),V,T) :- here(property(P,D2),V,T).

erreur(multipleValuesForaFluent):- holds(F,V,T); holds(F,W,T); V!=W.


% Default

holds(property(P,M), unknown, T) :- def(property(P,M), unknown, T).

def(property(P,M), unknown, T) :- holds(exists(data(M)), true, T);
                                    property(P,M);
                                    not holds(property(P,M),V,T): propvalue(P,V), V!=unknown; 
                                    not gen(_,M,_).
holds(property(P,M), unknown, T) :- holds(exists(data(M)), true, T);
                                    property(P,M);
                                    not holds(property(P,M),V,T): propvalue(P,V), V!=unknown; 
                                    not heredit(P).

erreur(mat(M)):- holds(exists(data(M)), true, T);
                                    property(P,M);
                                    not holds(property(P,M),V,T): propvalue(P,V), V!=unknown; 
                                    not gen(_,M,_).




% Disable the execution of the same action twice (on the same data)
same(A,B) :- same(B,A).
:- occ(A,T), occ(B,Z), same(A,B), Z<T.
%:- occ(A,T), occ(A,Z), Z<T.


%%% SHOW SECTION




%gen(M,T) :- holds(exists(data(M)), true, T); gen(_,M,_).
#show gen/3.
#show def/3.
#show here/3.

%bool(M,T):- holds(property(type,M), bool, T).
%#show bool/2.
%null(M,V,T):- holds(property(hasNullVal,M), V, T).
%#show null/3.

clement :- occ(featSelName(1,2),1); occ(fuzzyClu(2,3,4),2);
           occ(discretize(3,5), 3); occ(signatureMining(5,6), 4).
%:- not clement.
#show erreur/1.
#show occ/2.
#project occ/2.
