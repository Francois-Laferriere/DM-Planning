%%%
%%%  TYPES 
%%%

#const nbData = 15.

data(1..nbData).

kmeansValue(3).
dist(euc).



%%%
%%%  FLUENTS 
%%%

value(F,true) :- fluent(F).
value(F,false) :- fluent(F).

fluent(exists(data(X))) :- data(X).  

%%%
%%% PROPERTIES
%%%

% data structure 
property( struct ).
value( struct, matrix).
value( struct, patterns).
value( struct, signatures).

% does data have missing values
property( hasNullVal ).
value( hasNullVal, true).
value( hasNullVal, false).

% type of value in the data
property( type ).
value( type, bool).
value( type, numeric).
value( type, categorical).
value( type, mix).

% does data come from clustering
property( getByClu ).
value( getByClu, true).
value( getByClu, false).

% does the feature have been selected 
property( featClean ).
value( featClean, true).
value( featClean, false).

%%%
%%% HEREDITY
%%%

% define which properties will be transmitted to new data 
heredit( getByClu ).
heredit( hasColumnName ).
heredit( hasTimeStamp ).
heredit( hasNullVal ).
heredit( featClean ).
heredit( type ).

%heredit(flag, toto).
%property( flag ).   
%value( flag, toto).
%value( flag, lulu).
%init(flag, toto, 1).

%%% Default
%default(type      , numeric).
%default(hasNullVal, false  ).


%%%
%%%  INITIAL STATE 
%%%

init(X,false) :- fluent(X); not init(X,true).
init(exists(data(1)), true).

init(struct  , matrix , 1).
init(type    , numeric, 1).
init(getByClu, false  , 1).
init(hasTimeStamp, true  , 1).
init(hasColumnName, true  , 1).
init(featClean, false  , 1).



%%%
%%%   ACTION DESCRIPTION
%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     K-MEANS        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%action(kmeans(In, Dist, Out1, Out2)) :- 
%            data(In); dist(Dist); data(Out1); data(Out2); In<Out1; Out2=Out1+1.
%
%same(kmeans(In, Dist, X1, X2), kmeans(In, Dist, Y1, Y2)) :-
%            action(kmeans(In, Dist, X1, X2)); action(kmeans(In, Dist, Y1, Y2)).
%
%
%%%% exist
%
%precond(kmeans(In, Dist, Out1, Out2), exists(data(In)) , true ) :- action(kmeans(In, Dist, Out1, Out2)). 
%precond(kmeans(In, Dist, Out1, Out2), exists(data(Out1)), false) :- action(kmeans(In, Dist, Out1, Out2)). 
%precond(kmeans(In, Dist, Out1, Out2), exists(data(Out2)), false) :- action(kmeans(In, Dist, Out1, Out2)). 
%
%effect(kmeans(In, Dist, Out1, Out2), exists(data(Out1)), true) :- action(kmeans(In, Dist, Out1, Out2)). 
%effect(kmeans(In, Dist, Out1, Out2), exists(data(Out2)), true) :- action(kmeans(In, Dist, Out1, Out2)). 
%
%generate(kmeans(In, Dist, Out1, Out2), In, Out1 ) :- action(kmeans(In, Dist, Out1, Out2)). 
%generate(kmeans(In, Dist, Out1, Out2), In, Out2 ) :- action(kmeans(In, Dist, Out1, Out2)). 
%
%%%% properties
%
%propPrecond(kmeans(In, Dist, Out1, Out2), struct, matrix, In ) :- action(kmeans(In, Dist, Out1, Out2)). 
%propPrecond(kmeans(In, Dist, Out1, Out2), struct, matrix, In ) :- action(kmeans(In, Dist, Out1, Out2)). 
%propPrecond(kmeans(In, Dist, Out1, Out2), hasNullVal, false, In ) :- action(kmeans(In, Dist, Out1, Out2)). 
%propPrecond(kmeans(In, Dist, Out1, Out2), getByClu  , false, In ) :- action(kmeans(In, Dist, Out1, Out2)). 
%
%propEffect(kmeans(In, Dist, Out1, Out2), struct, matrix, Out1 ) :- action(kmeans(In, Dist, Out1, Out2)). 
%propEffect(kmeans(In, Dist, Out1, Out2), struct, matrix, Out2 ) :- action(kmeans(In, Dist, Out1, Out2)). 
%
%propEffect(kmeans(In, Dist, Out1, Out2), getByClu, true, Out1 ) :- action(kmeans(In, Dist, Out1, Out2)). 
%propEffect(kmeans(In, Dist, Out1, Out2), getByClu, true, Out2 ) :- action(kmeans(In, Dist, Out1, Out2)). 
%
%propEffect(kmeans(In, Dist, Out1, Out2), hasNullVal, false, Out1 ) :- action(kmeans(In, Dist, Out1, Out2)). 
%propEffect(kmeans(In, Dist, Out1, Out2), hasNullVal, false, Out2 ) :- action(kmeans(In, Dist, Out1, Out2)). 



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      input2        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%% an action with 2 inputs

%action(input2(In1, In2, Out)) :- data(In1); data(In2); data(Out); In1<Out; In2<Out;
%In1!=In2.
%
%same(input2(In1, In2,X), input2(In1, In2,Y)) :- action(input2(In1, In2, X)); action(input2(In1, In2, Y)).
%
%precond(input2(In1, In2, Out), exists(data(In1)), true ) :- action(input2(In1, In2, Out)). 
%precond(input2(In1, In2, Out), exists(data(In2)), true ) :- action(input2(In1, In2, Out)). 
%precond(input2(In1, In2, Out), exists(data(Out)), false) :- action(input2(In1, In2, Out)). 
%
%effect(input2(In1, In2, Out), exists(data(Out)), true) :- action(input2(In1, In2, Out)). 
%
%generate(input2(In1, In2, Out), In1, Out) :- action(input2(In1, In2, Out)). 
%
%propPrecond(input2(In1, In2, Out), struct, matrix, In1 ) :- action(input2(In1, In2, Out)). 
%propPrecond(input2(In1, In2, Out), struct, matrix, In2 ) :- action(input2(In1, In2, Out)). 
%
%propEffect(input2(In1, In2, Out), struct  , matrix, Out ) :- action(input2(In1, In2, Out)). 
%%propEffect(input2(In1, In2, Out), getByClu, false , Out ) :- action(input2(In1, In2, Out)). 



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   FEATSELNAME      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(featSelName(In, Out)) :- data(In); data(Out); In<Out.

same(featSelName(In,Out1), featSelName(In,Out2)) :- action(featSelName(In, Out1));action(featSelName(In, Out2)).

precond(featSelName(In, Out), exists(data(In)), true )  :- action(featSelName(In, Out)). 
precond(featSelName(In, Out), exists(data(Out)), false) :- action(featSelName(In, Out)). 

effect(featSelName(In, Out), exists(data(Out)), true) :- action(featSelName(In, Out)). 

generate(featSelName(In, Out), In, Out) :- action(featSelName(In, Out)).

propPrecond(featSelName(In, Out), hasColumnName, true, In) :- action(featSelName(In,Out)).
propPrecond(featSelName(In, Out), featClean, false, In) :- action(featSelName(In,Out)).

propEffect(featSelName(In, Out), struct  , matrix, Out ) :- action(featSelName(In, Out)). 
propEffect(featSelName(In, Out), featClean  , true, Out ) :- action(featSelName(In, Out)). 

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   FUZZY CLU        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(fuzzyClu(In, Out1, Out2)) :- 
            data(In); data(Out1); data(Out2); In<Out1; Out2=Out1+1.

same(fuzzyClu(In, X1, X2), fuzzyClu(In, Y1, Y2)) :-
            action(fuzzyClu(In, X1, X2)); action(fuzzyClu(In, Y1, Y2)).


precond(fuzzyClu(In, Out1, Out2), exists(data(In)), true )  :- action(fuzzyClu(In, Out1, Out2)). 
precond(fuzzyClu(In, Out1, Out2), exists(data(Out1)), false) :- action(fuzzyClu(In, Out1, Out2)). 
precond(fuzzyClu(In, Out1, Out2), exists(data(Out2)), false) :- action(fuzzyClu(In, Out1, Out2)). 

effect(fuzzyClu(In, Out1, Out2), exists(data(Out1)), true) :- action(fuzzyClu(In, Out1, Out2)). 
effect(fuzzyClu(In, Out1, Out2), exists(data(Out2)), true) :- action(fuzzyClu(In, Out1, Out2)). 

generate(fuzzyClu(In, Out1, Out2), In, Out1 ) :- action(fuzzyClu(In, Out1, Out2)). 
generate(fuzzyClu(In, Out1, Out2), In, Out2 ) :- action(fuzzyClu(In, Out1, Out2)). 

propPrecond(fuzzyClu(In, Out1, Out2), struct  , matrix, In) :- action(fuzzyClu(In, Out1, Out2)). 
propPrecond(fuzzyClu(In, Out1, Out2), getByClu  , false, In) :- action(fuzzyClu(In, Out1, Out2)). 

propEffect(fuzzyClu(In, Out1, Out2), struct  , matrix, Out1 ) :- action(fuzzyClu(In, Out1, Out2)). 
propEffect(fuzzyClu(In, Out1, Out2), struct  , matrix, Out2 ) :- action(fuzzyClu(In, Out1, Out2)). 

propEffect(fuzzyClu(In, Out1, Out2), getByClu  , true, Out1) :- action(fuzzyClu(In, Out1, Out2)). 
propEffect(fuzzyClu(In, Out1, Out2), getByClu  , true, Out2) :- action(fuzzyClu(In, Out1, Out2)). 


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   DISCRETIZE       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(discretize(In, Out)) :- data(In); data(Out); In<Out.

same(discretize(In,Out1), discretize(In,Out2)) :- action(discretize(In, Out1));action(discretize(In, Out2)).

precond(discretize(In, Out), exists(data(In)) , true )  :- action(discretize(In, Out)). 
precond(discretize(In, Out), exists(data(Out)), false) :- action(discretize(In, Out)). 

effect(discretize(In, Out), exists(data(Out)), true) :- action(discretize(In, Out)). 

generate(discretize(In, Out), In, Out) :- action(discretize(In, Out)).

propPrecond(discretize(In, Out), struct, matrix , In) :- action(discretize(In, Out)).
propPrecond(discretize(In, Out), type  , numeric, In) :- action(discretize(In, Out)).

propEffect(discretize(In, Out), struct  , matrix, Out ) :- action(discretize(In, Out)). 
propEffect(discretize(In, Out), type    , bool  , Out ) :- action(discretize(In, Out)). 


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  SIGNATURE MINING  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(signatureMining(In, Out)) :- data(In); data(Out); In<Out.

same(signatureMining(In,Out1), signatureMining(In,Out2)) :- action(signatureMining(In, Out1));action(signatureMining(In, Out2)).

precond(signatureMining(In, Out), exists(data(In)) , true ) :- action(signatureMining(In, Out)). 
precond(signatureMining(In, Out), exists(data(Out)), false) :- action(signatureMining(In, Out)). 

effect(signatureMining(In, Out),  exists(data(Out)), true) :- action(signatureMining(In, Out)). 

generate(signatureMining(In, Out), In, Out) :- action(signatureMining(In, Out)).

propPrecond(signatureMining(In, Out), type        , bool, In) :- action(signatureMining(In,Out)).
propPrecond(signatureMining(In, Out), hasTimeStamp, true, In) :- action(signatureMining(In,Out)).

propEffect(signatureMining(In, Out) , struct, signature, Out) :- action(signatureMining(In,Out)).


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   SENSE NULL VAL   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(senseNullVal(In,Out)) :- data(In); data(Out); In<Out.

same(senseNullVal(In,Out1), senseNullVal(In,Out2)) :- action(senseNullVal(In,Out1));action(senseNullVal(In, Out2)).

precond(senseNullVal(In, Out), exists(data(In)) , true )  :- action(senseNullVal(In, Out)). 
precond(senseNullVal(In, Out), exists(data(Out)), false) :- action(senseNullVal(In, Out)). 

effect( senseNullVal(In, Out), exists(data(Out)), true ) :- action(senseNullVal(In, Out)). 
generate(senseNullVal(In, Out), In, Out) :- action(senseNullVal(In, Out)).

propPrecond(senseNullVal(In, Out), hasNullVal, unknown, In) :- action(senseNullVal(In, Out)). 

propEffect(senseNullVal(In, Out), hasNullVal, sensed, Out) :- action(senseNullVal(In,Out)).

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   REMOVE NULL VAL  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(removeNullVal(In,Out)) :- data(In); data(Out); In<Out.

same(removeNullVal(In,Out1), removeNullVal(In,Out2)) :- action(removeNullVal(In,Out1));action(removeNullVal(In, Out2)).

precond(removeNullVal(In, Out), exists(data(In)) , true ) :- action(removeNullVal(In, Out)). 
precond(removeNullVal(In, Out), exists(data(Out)), false) :- action(removeNullVal(In, Out)). 
effect( removeNullVal(In, Out), exists(data(Out)), true ) :- action(removeNullVal(In, Out)). 
generate(removeNullVal(In, Out), In, Out) :- action(removeNullVal(In, Out)).

propPrecond(removeNullVal(In, Out), hasNullVal, true, In) :- action(removeNullVal(In, Out)). 

propEffect(removeNullVal(In, Out), hasNullVal, false, Out) :- action(removeNullVal(In, Out)). 



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%    ASSERSTION      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(getNullVal(In,Out)) :- data(In); data(Out); In<Out.

same(getNullVal(In,Out1), getNullVal(In,Out2)) :- action(getNullVal(In,Out1));action(getNullVal(In, Out2)).

precond(getNullVal(In, Out), exists(data(In)) , true ) :- action(getNullVal(In, Out)). 
precond(getNullVal(In, Out), exists(data(Out)), false) :- action(getNullVal(In, Out)). 
effect( getNullVal(In, Out), exists(data(Out)), true ) :- action(getNullVal(In, Out)). 
generate(getNullVal(In, Out), In, Out) :- action(getNullVal(In, Out)).

propPrecond(getNullVal(In, Out), hasNullVal, sensed, In) :- action(getNullVal(In, Out)). 

propEffect(getNullVal(In, Out), hasNullVal, false, Out) :- action(getNullVal(In, Out)). 
