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
%%% REMOVE STOP WORDS  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(removeStopWords(In, Out)) :- data(In); data(Out); In<Out.

same(removeStopWords(In,Out1), removeStopWords(In,Out2)) :- action(removeStopWords(In, Out1));action(removeStopWords(In, Out2)).

precond(removeStopWords(In, Out), exists(data(In)), true )  :- action(removeStopWords(In, Out)). 
precond(removeStopWords(In, Out), exists(data(Out)), false) :- action(removeStopWords(In, Out)). 
effect(removeStopWords(In, Out), exists(data(Out)), true) :- action(removeStopWords(In, Out)). 

generate(removeStopWords(In, Out), In, Out) :- action(removeStopWords(In, Out)).

precond(removeStopWords(In, Out), property(colAreWords, In), true) :- action(removeStopWords(In,Out)).
precond(removeStopWords(In, Out), property(type, In), numeric) :- action(removeStopWords(In,Out)).

effect(removeStopWords(In, Out), property(struct   , Out), matrix) :- action(removeStopWords(In, Out)). 




%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   groupByStemp     %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(groupByStemp(In, Out)) :- data(In); data(Out); In<Out.

same(groupByStemp(In,Out1), groupByStemp(In,Out2)) :- action(groupByStemp(In, Out1));action(groupByStemp(In, Out2)).

precond(groupByStemp(In, Out), exists(data(In)), true )  :- action(groupByStemp(In, Out)). 
precond(groupByStemp(In, Out), exists(data(Out)), false) :- action(groupByStemp(In, Out)). 
effect(groupByStemp(In, Out), exists(data(Out)), true) :- action(groupByStemp(In, Out)). 

generate(groupByStemp(In, Out), In, Out) :- action(groupByStemp(In, Out)).

precond(groupByStemp(In, Out), property(type, In), numeric) :- action(groupByStemp(In,Out)).
precond(groupByStemp(In, Out), property(colAreWords, In), true) :- action(groupByStemp(In,Out)).
%precond(groupByStemp(In, Out), property(featClean    , In), false) :- action(groupByStemp(In,Out)).

effect(groupByStemp(In, Out), property(struct   , Out), matrix) :- action(groupByStemp(In, Out)). 
effect(groupByStemp(In, Out), property(featClean, Out), true) :- action(groupByStemp(In, Out)). 



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   FUZZY CLU        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(fuzzyClu(In, Out1, Out2)) :- data(In); data(Out1); data(Out2); In<Out1; Out2=Out1+1.

same(fuzzyClu(In, X1, X2), fuzzyClu(In, Y1, Y2)) :-
            action(fuzzyClu(In, X1, X2)); action(fuzzyClu(In, Y1, Y2)).


precond(fuzzyClu(In, Out1, Out2), exists(data(In)), true )  :- action(fuzzyClu(In, Out1, Out2)). 
precond(fuzzyClu(In, Out1, Out2), exists(data(Out1)), false) :- action(fuzzyClu(In, Out1, Out2)). 
precond(fuzzyClu(In, Out1, Out2), exists(data(Out2)), false) :- action(fuzzyClu(In, Out1, Out2)). 

effect(fuzzyClu(In, Out1, Out2), exists(data(Out1)), true) :- action(fuzzyClu(In, Out1, Out2)). 
effect(fuzzyClu(In, Out1, Out2), exists(data(Out2)), true) :- action(fuzzyClu(In, Out1, Out2)). 

generate(fuzzyClu(In, Out1, Out2), In, Out1 ) :- action(fuzzyClu(In, Out1, Out2)). 
generate(fuzzyClu(In, Out1, Out2), In, Out2 ) :- action(fuzzyClu(In, Out1, Out2)). 

precond(fuzzyClu(In, Out1, Out2), property(hasNullVal, In), false)    :- action(fuzzyClu(In, Out1, Out2)). 
precond(fuzzyClu(In, Out1, Out2), property(struct, In), matrix)    :- action(fuzzyClu(In, Out1, Out2)). 
%precond(fuzzyClu(In, Out1, Out2), property(getByClu, In), false)   :- action(fuzzyClu(In, Out1, Out2)). 
precond(fuzzyClu(In, Out1, Out2), property(type, In), numeric)   :- action(fuzzyClu(In, Out1, Out2)). 
precond(fuzzyClu(In, Out1, Out2), property(colAreWords, In), true) :- action(fuzzyClu(In,Out1,Out2)).


effect(fuzzyClu(In, Out1, Out2), property(struct, Out1), matrix) :- action(fuzzyClu(In, Out1, Out2)). 
effect(fuzzyClu(In, Out1, Out2), property(struct, Out2), matrix) :- action(fuzzyClu(In, Out1, Out2)). 


%effect(fuzzyClu(In, Out1, Out2), property(getByClu, Out1), true) :- action(fuzzyClu(In, Out1, Out2)). 
%effect(fuzzyClu(In, Out1, Out2), property(getByClu, Out2), true) :- action(fuzzyClu(In, Out1, Out2)). 

effect(fuzzyClu(In, Out1, Out2), property(colAreWords, Out1), false) :- action(fuzzyClu(In, Out1, Out2)). 
effect(fuzzyClu(In, Out1, Out2), property(labeled, Out2), false) :- action(fuzzyClu(In, Out1, Out2)). 
effect(fuzzyClu(In, Out1, Out2), property(hasTimeStamp, Out2), false) :- action(fuzzyClu(In, Out1, Out2)). 


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   DISCRETIZE       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(discretize(In, Out)) :- data(In); data(Out); In<Out.

same(discretize(In,Out1), discretize(In,Out2)) :- action(discretize(In, Out1));action(discretize(In, Out2)).

precond(discretize(In, Out), exists(data(In)) , true )  :- action(discretize(In, Out)). 
precond(discretize(In, Out), exists(data(Out)), false) :- action(discretize(In, Out)). 

effect(discretize(In, Out), exists(data(Out)), true) :- action(discretize(In, Out)). 

generate(discretize(In, Out), In, Out) :- action(discretize(In, Out)).

precond(discretize(In, Out), property(hasNullVal, In), false ) :- action(discretize(In, Out)).
precond(discretize(In, Out), property(struct, In), matrix ) :- action(discretize(In, Out)).
precond(discretize(In, Out), property(type  , In), numeric) :- action(discretize(In, Out)).

effect(discretize(In, Out), property(struct, Out), matrix) :- action(discretize(In, Out)). 
effect(discretize(In, Out), property(type  , Out), bool  ) :- action(discretize(In, Out)). 

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  SIGNATURE MINING  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%action(topKitem(In, Out)) :- data(In); data(Out); In<Out.

%same(topKitem(In,Out1), topKitem(In,Out2)) :- action(topKitem(In, Out1));action(topKitem(In, Out2)).
%
%precond(topKitem(In, Out), exists(data(In)) , true ) :- action(topKitem(In, Out)). 
%precond(topKitem(In, Out), exists(data(Out)), false) :- action(topKitem(In, Out)). 
%
%effect(topKitem(In, Out),  exists(data(Out)), true) :- action(topKitem(In, Out)). 
%
%generate(topKitem(In, Out), In, Out) :- action(topKitem(In, Out)).
%
%precond(topKitem(In, Out), property(type, In), bool) :- action(topKitem(In,Out)).
%precond(topKitem(In, Out), property(hasTimeStamp, In), true) :- action(topKitem(In,Out)).
%
%effect(topKitem(In, Out) , property(struct, Out), signature) :- action(topKitem(In,Out)).



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  SIGNATURE MINING  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(signatureMining(In, Out)) :- data(In); data(Out); In<Out.

same(signatureMining(In,Out1), signatureMining(In,Out2)) :- action(signatureMining(In, Out1));action(signatureMining(In, Out2)).

precond(signatureMining(In, Out), exists(data(In)) , true ) :- action(signatureMining(In, Out)). 
precond(signatureMining(In, Out), exists(data(Out)), false) :- action(signatureMining(In, Out)). 

effect(signatureMining(In, Out),  exists(data(Out)), true) :- action(signatureMining(In, Out)). 

generate(signatureMining(In, Out), In, Out) :- action(signatureMining(In, Out)).

precond(signatureMining(In, Out), property(type, In), bool) :- action(signatureMining(In,Out)).
precond(signatureMining(In, Out), property(hasTimeStamp, In), true) :- action(signatureMining(In,Out)).

effect(signatureMining(In, Out) , property(struct, Out), signature) :- action(signatureMining(In,Out)).


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  pattern MINING  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(patternMining(In, Out)) :- data(In); data(Out); In<Out.

same(patternMining(In,Out1), patternMining(In,Out2)) :- action(patternMining(In, Out1));action(patternMining(In, Out2)).

precond(patternMining(In, Out), exists(data(In)) , true ) :- action(patternMining(In, Out)). 
precond(patternMining(In, Out), exists(data(Out)), false) :- action(patternMining(In, Out)). 

effect(patternMining(In, Out),  exists(data(Out)), true) :- action(patternMining(In, Out)). 

generate(patternMining(In, Out), In, Out) :- action(patternMining(In, Out)).

precond(patternMining(In, Out), property(type, In), bool) :- action(patternMining(In,Out)).
precond(patternMining(In, Out), property(hasTimeStamp, In), true) :- action(patternMining(In,Out)).

effect(patternMining(In, Out) , property(struct, Out), pattern) :- action(patternMining(In,Out)).




%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   SENSE NULL VAL   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%action(senseNullVal(In,Out)) :- data(In); data(Out); In<Out.
%
%same(senseNullVal(In,Out1), senseNullVal(In,Out2)) :- action(senseNullVal(In,Out1));action(senseNullVal(In, Out2)).
%
%precond(senseNullVal(In, Out), exists(data(In)) , true )  :- action(senseNullVal(In, Out)). 
%precond(senseNullVal(In, Out), exists(data(Out)), false) :- action(senseNullVal(In, Out)). 
%
%effect(senseNullVal(In, Out), exists(data(Out)), true ) :- action(senseNullVal(In, Out)). 
%generate(senseNullVal(In, Out), In, Out) :- action(senseNullVal(In, Out)).
%
%precond(senseNullVal(In, Out), property(hasNullVal, In), unknown) :- action(senseNullVal(In, Out)). 
%
%effect(senseNullVal(In, Out), property(hasNullVal, Out), sensed) :- action(senseNullVal(In,Out)).

action(senseNullVal(In)) :- data(In).
precond(senseNullVal(In), exists(data(In)) , true )          :- action(senseNullVal(In)). 
precond(senseNullVal(In), property(hasNullVal, In), unknown) :- action(senseNullVal(In)). 
effect( senseNullVal(In), property(hasNullVal, In), sensed)  :- action(senseNullVal(In)).



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   REMOVE NULL VAL  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(removeNullVal(In,Out)) :- data(In); data(Out); In<Out.

same(removeNullVal(In,Out1), removeNullVal(In,Out2)) :- action(removeNullVal(In,Out1));action(removeNullVal(In, Out2)).

precond(removeNullVal(In, Out), exists(data(In)) , true ) :- action(removeNullVal(In, Out)). 
precond(removeNullVal(In, Out), exists(data(Out)), false) :- action(removeNullVal(In, Out)). 
effect( removeNullVal(In, Out), exists(data(Out)), true ) :- action(removeNullVal(In, Out)). 
generate(removeNullVal(In, Out), In, Out) :- action(removeNullVal(In, Out)).

precond(removeNullVal(In, Out), property(hasNullVal, In), true) :- action(removeNullVal(In, Out)). 

effect(removeNullVal(In, Out), property(hasNullVal, Out), false) :- action(removeNullVal(In, Out)). 


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  ASSER GETNULLVAL  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(getNullVal(In,Out)) :- data(In); data(Out); In<Out.

same(getNullVal(In,Out1), getNullVal(In,Out2)) :- action(getNullVal(In,Out1));action(getNullVal(In, Out2)).

precond(getNullVal(In, Out), exists(data(In)) , true ) :- action(getNullVal(In, Out)). 
precond(getNullVal(In, Out), exists(data(Out)), false) :- action(getNullVal(In, Out)). 
effect( getNullVal(In, Out), exists(data(Out)), true ) :- action(getNullVal(In, Out)). 
generate(getNullVal(In, Out), In, Out) :- action(getNullVal(In, Out)).

precond(getNullVal(In, Out), property(hasNullVal, In), sensed) :- action(getNullVal(In, Out)). 

effect(getNullVal(In, Out), property(hasNullVal, Out), false) :- action(getNullVal(In, Out)). 

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  SPLIT CLASS       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(splitClass(In, Out1, Out2)) :- 
            data(In); data(Out1); data(Out2); In<Out1; Out2=Out1+1.

same(splitClass(In, X1, X2), splitClass(In, Y1, Y2)) :-
            action(splitClass(In, X1, X2)); action(splitClass(In, Y1, Y2)).


precond(splitClass(In, Out1, Out2), exists(data(In)), true )  :- action(splitClass(In, Out1, Out2)). 
precond(splitClass(In, Out1, Out2), exists(data(Out1)), false) :- action(splitClass(In, Out1, Out2)). 
precond(splitClass(In, Out1, Out2), exists(data(Out2)), false) :- action(splitClass(In, Out1, Out2)). 

effect(splitClass(In, Out1, Out2), exists(data(Out1)), true) :- action(splitClass(In, Out1, Out2)). 
effect(splitClass(In, Out1, Out2), exists(data(Out2)), true) :- action(splitClass(In, Out1, Out2)). 
generate(splitClass(In, Out1, Out2), In, Out1 ) :- action(splitClass(In, Out1, Out2)). 
generate(splitClass(In, Out1, Out2), In, Out2 ) :- action(splitClass(In, Out1, Out2)). 

precond(splitClass(In, Out1, Out2), property(struct, In), matrix)    :- action(splitClass(In, Out1, Out2)). 
precond(splitClass(In, Out1, Out2), property(labeled, In), true)    :- action(splitClass(In, Out1, Out2)). 


effect(splitClass(In, Out1, Out2), property(struct, Out1), matrix) :- action(splitClass(In, Out1, Out2)). 
effect(splitClass(In, Out1, Out2), property(struct, Out2), matrix) :- action(splitClass(In, Out1, Out2)). 

effect(splitClass(In, Out1, Out2), property(labeled, Out1), false) :- action(splitClass(In, Out1, Out2)). 
effect(splitClass(In, Out1, Out2), property(labeled, Out2), false) :- action(splitClass(In, Out1, Out2)). 



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   SENSE BALANCE    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action( senseBalance(In)) :- data(In).
precond(senseBalance(In), exists(data(In))      , true )   :- action(senseBalance(In)). 
precond(senseBalance(In), property(labeled,  In), true)    :- action(senseBalance(In)). 
precond(senseBalance(In), property(balanced, In), unknown) :- action(senseBalance(In)). 
effect( senseBalance(In), property(balanced, In), sensed)  :- action(senseBalance(In)).


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   ASSER BALANCE    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action( asserBalance(In,Out)) :- data(In); data(Out); In<Out.
same(asserBalance(In,Out1), asserBalance(In,Out2)) :-
action(asserBalance(In,Out1));action(asserBalance(In,Out2)).
generate(asserBalance(In, Out), In, Out) :- action(asserBalance(In, Out)).

precond(asserBalance(In,Out), exists(data(In))      , true )  :-action(asserBalance(In,Out)). 
precond(asserBalance(In,Out), exists(data(Out))     , false)  :-action(asserBalance(In,Out)). 
effect( asserBalance(In,Out), exists(data(Out))     , true )  :-action(asserBalance(In,Out)).

%precond(asserBalance(In,Out), property(labeled,  In), true) :-action(asserBalance(In,Out)). 
precond(asserBalance(In,Out), property(balanced, In ), sensed):-action(asserBalance(In,Out)). 
effect( asserBalance(In,Out), property(balanced, Out), true ) :-action(asserBalance(In,Out)).





%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   OVER-SAMPLING    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(overSampling(In,Out)) :- data(In); data(Out); In<Out.
same(overSampling(In,Out1), overSampling(In,Out2)) :-
action(overSampling(In,Out1));action(overSampling(In,Out2)).
generate(overSampling(In, Out), In, Out) :- action(overSampling(In, Out)).

precond(overSampling(In,Out), exists(data(In))      , true ) :- action(overSampling(In,Out)). 
precond(overSampling(In,Out), exists(data(Out))     , false) :- action(overSampling(In,Out)). 
effect( overSampling(In,Out), exists(data(Out))     , true ) :- action(overSampling(In,Out)). 

precond(overSampling(In,Out), property(labeled,  In), true ) :- action(overSampling(In,Out)). 
precond(overSampling(In,Out), property(balanced, In), false) :- action(overSampling(In,Out)). 
effect( overSampling(In,Out), property(balanced, Out),true ) :- action(overSampling(In,Out)).


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  UNDER-SAMPLING    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(underSampling(In,Out)) :- data(In); data(Out); In<Out.
same(underSampling(In,Out1), underSampling(In,Out2))
:-action(underSampling(In,Out1));action(underSampling(In,Out2)).
generate(underSampling(In, Out), In, Out) :- action(underSampling(In, Out)).

precond(underSampling(In,Out), exists(data(In))      , true ) :-action(underSampling(In,Out)). 
precond(underSampling(In,Out), exists(data(Out))     , false) :-action(underSampling(In,Out)). 
effect( underSampling(In,Out), exists(data(Out))     , true ) :-action(underSampling(In,Out)). 

precond(underSampling(In,Out), property(labeled,  In), true ) :-action(underSampling(In,Out)). 
precond(underSampling(In,Out), property(balanced, In), false) :-action(underSampling(In,Out)). 
effect( underSampling(In,Out), property(balanced, Out),true ) :-action(underSampling(In,Out)).


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       SVM          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

action( svm(In,Out)) :- data(In); data(Out); In<Out.
same(svm(In,Out1), svm(In,Out2)) :- action(svm(In,Out1)); action(svm(In,Out2)).
generate(svm(In, Out), In, Out) :- action(svm(In, Out)).



precond(svm(In,Out), exists(data(In))     , true  ) :- action(svm(In,Out)). 
precond(svm(In,Out), exists(data(Out))    , false ) :- action(svm(In,Out)). 
effect( svm(In,Out), exists(data(Out))    , true  ) :- action(svm(In,Out)). 

precond(svm(In,Out), property(struct, In ), matrix ) :- action(svm(In,Out)). 
precond(svm(In,Out), property(type  , In ), numeric) :- action(svm(In,Out)). 
precond(svm(In,Out), property(labeled,In ), true   ) :- action(svm(In,Out)). 
effect( svm(In,Out), property(struct, Out), model  ) :- action(svm(In,Out)).


