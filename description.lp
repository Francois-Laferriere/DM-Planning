%%%
%%%  TYPES 
%%%
#const nbData = 11.
data(1..nbData).
kmeansValue(3).
dist(euc).

%%%
%%%  FLUENTS 
%%%
fluent(exists(data(X))) :- data(X).  
fluent(property(P,D)) :- property(P,D).
value(exists(data(X)),true)  :- fluent(exists(data(X))).
value(exists(data(X)),false) :- fluent(exists(data(X))).

%%%
%%% PROPERTIES
%%%
property(P,M) :- property(P), data(M).
value(property(P,M), V) :- propvalue(P,V); property(P); data(M).
propvalue(P, unknown) :- property(P).
propvalue(P, sensed ) :- property(P).

% data structure 
property( struct ).
propvalue( struct, matrix).
propvalue( struct, pattern).
propvalue( struct, signature).

% does data have missing values
property( hasNullVal ).
propvalue( hasNullVal, true).
propvalue( hasNullVal, false).

%% type of value in the data
property( type ).
propvalue( type, bool).
propvalue( type, numeric).
propvalue( type, categorical).
propvalue( type, mix).

% does data come from clustering
property( getByClu ).
propvalue( getByClu, true).
propvalue( getByClu, false).

% does the feature have been selected 
property( featClean ).
propvalue( featClean, true).
propvalue( featClean, false).

% does the matrix have class 
property( labeled ).
propvalue( labeled, true).
propvalue( labeled, false).

% does the matrix have class 
property( hasTimeStamp ).
propvalue( hasTimeStamp, true).
propvalue( hasTimeStamp, false).

% does the matrix have class 
property(  colAreWords ).
propvalue( colAreWords, true).
propvalue( colAreWords, false).

% does the matrix are balanced
property(  balanced ).
propvalue( balanced, true).
propvalue( balanced, false).




%%%
%%% HEREDITY
%%%

% define which properties will be transmitted to new data 
heredit( struct ).
heredit( getByClu ).
heredit( colAreWords ).
heredit( hasTimeStamp ).
heredit( hasNullVal ).
heredit( featClean ).
heredit( type ).
heredit( labeled ).
heredit( balanced ).

default( struct, unknown ).
default( getByClu, false).
default( colAreWords, unknown ).
default( hasTimeStamp, unknown ).
default( hasNullVal, unknown ).
default( featClean, false ).
default( type, unknown ).
default( labeled, unknown ).
default( balanced, unknown ).


%%%
%%%  INITIAL STATE 
%%%

init(exists(data(1)), true).
init(exists(data(X)), false) :- data(X); not init(exists(data(X)), true).

init( property(struct       , 1), matrix ).
init( property(type         , 1), numeric).
init( property(getByClu     , 1), false  ).
init( property(hasTimeStamp , 1), true   ).
init( property(colAreWords,   1), false   ).
init( property(featClean    , 1), false  ).
%init( property(hasNullVal   , 1), false  ).
init( property(labeled      , 1), true  ).
%init( property(balanced     , 1), false  ).

% by default properties are unknown

init(property(P,M),D):- default(P,D); property(P); data(M); not init(property(P,M),V): V!=D, propvalue(P,V).




%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%    KNOWLEDGE       %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(none).
occ(none, T):- occ(none,T-1); step(T).

:- gen(A,_,T1); gen(B,_,T2); A<B; T2<T1.

:- occ(signatureMining(A,_),_); occ(signatureMining(B,_),_); des(A,B).
:- occ(patternMining(A,_),_); occ(patternMining(B,_),_); des(A,B).


:- occ(splitClass(A,X,Y), _); occ(discretize(X,_),_); occ(discretize(Y,_),_).
:- occ(splitClass(A,X,Y), _); occ(removeStopWords(X,_),_); occ(removeStopWords(Y,_),_).

%:- occ(splitClass(A,X,Y),T); not gen(X,S,F): data(S), step(F), F<T+2; not gen(Y,C,I): data(C),
%step(I), I<T+2.

%knowledge(text).
%sw:- occ(removeStopWords(_,_),_); knowledge(text).
%:- not sw.

:- occ(removeStopWords(A,_),_); occ(removeStopWords(B,_),_); des(A,B). 
:- occ(groupByStem(A,_),_); occ(groupByStem(B,_),_); des(A,B). 

:- occ(asserBalance(A,B),T1); not gen(B,C,T2): step(T2), data(C), T1<T2.
:- occ(getNullVal(A,B),T1); not gen(B,C,T2): step(T2), data(C), T1<T2.

:- occ(senseBalance(A),T1); not occ(asserBalance(A,B),T2): step(T2), data(B), T2=T1+1.
:- occ(senseNullVal(A),T1); not occ(getNullVal(A,B),T2): step(T2), data(B), T2=T1+1.


 

:- occ(groupByStemp(D,X),T); not occ(removeStopWords(O,Y), G): data(O), data(Y), G<T,
des(O,D), step(G).

:- #count{T: gen(A,_,T)} = C; C>1; data(A).
%occtwice(A):- #count{T: gen(A,_,T)} = C; C=2; data(A).
%:- #count{A: occtwice(A)}>2.


% we cannot know whether data are balanced or not if they are not labeled
:- holds(property(balanced,D),V,T); V!=unknown; not holds(property(labeled,D),true,T).


% we want a model
model:-occ(svm(_,_),_).
:- not model.
