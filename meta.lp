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

% Initialisation
has(P,V,M) :- init(P,V,M).

%:- 1 { has(struc, V, M): value( struct, V) } 1; holds(exists(data(M)), true, T).

% PROP precondition check
:- occ(A,T), propPrecond(A,P,V,M), not has(P,V,M).

% PROP Direct effects
has(P,V,M):- propEffect(A,P,V,M), occ(A,T).

% Default properties 
has(P,V,M) :- not has(P,W,M): value(P,W), W!=V; holds(exists(data(M)),true,_); default(P,V).

% Heredity
gen(M,O,T) :- occ(A,T); generate(A,M,O).
has(P,V,O) :- has(P,V,M); heredit(P); not has(P,W,O): value(P,W), W!=V; gen(M,O,_).

% There is conflict if a property is set to both inherited and by default
%:- heredit(X); default(X,_).


% Disable the execution of the same action twice (on the same data)
same(A,B) :- same(B,A).
:- occ(A,T), occ(B,Z), same(A,B), Z<T.
%:- occ(A,T), occ(A,Z), Z<T.




%%% SHOW SECTION

%#show father(X,Y,T) : has(father(X,Y),true,T).
%#show miss(X,T) : has(hasMissVal(X),false,T).

%#show father(X,Y, V) : has(father(X,Y),V,T).
%#show fath(X,T) : has(father(X), true,T).
%#show kw(F,T): has(kw(F),true,T).
%#show precond(C,V): pprecond(kmeans(1,euclidian,3),C,V).

%#show score(X,V,T): has(score(X),V,T).
%#show pat(X,T) : has(holds(patterns(X)), true, T).
%#show holds(M,T): holds(exists(data(M)), true, T).
%#show col(M,T): has(hasColName(M), true, T).
%#show num(M,T): has(isNumeric(M), true, T).
%#show bin(M,T): has(isBinary(M), true, T).
%#show timeStamp(M,T): has(hasTimeStamp(M), true, T).

%#show nbAction(N) : #sum {1,A:action(A)} = N.

%flag(V,M) :- has(flag,V,M).
%#show flag/2.
%miss(V,M) :- has(hasNullVal,V,M).
%#show miss/2.

%holds(M,T) :- holds(exists(data(M)), true, T).
%#show holds/2.

%clement :- occ(featSelName(1,2),1); occ(fuzzyClu(2,3,4),2); occ(discretize(3,5), 3); occ(signatureMining(5,6), 4).
%clement :- occ(featSelName(1,2),1); occ(senseNullVal(2,3),2); occ(getNullVal(3,4),3); occ(fuzzyClu(4,5,6),4); occ(discretize(5,7), 5); occ(signatureMining(7,8), 6).
%:- not clement.

#show occ/2.
%#project occ/2.
%has(V):-has(hasNullVal,V,4).
%#show has/1.
#show.
