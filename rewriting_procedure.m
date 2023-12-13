(* ::Package:: *)

(* ::Input:: *)
(*(* This code implements the algorithm described in Section II of "On NP-complete search problems on finite algebras" by Erhard Aichinger and Bernardo Rossi*)*)
(*(* The procedure rewrite takes as input two strings of letters in the format {"a", "b", "c"} called structure and polynomials and a vector of numbers in {1,2} called sigma. *)
(*The vector structure represents the family <c_i^j | j \[LessEqual] t+1 and i\[LessEqual] k_j> from Lemma 3. *)
(*The vector sigma represents the function sigma from Lemma 3.*)
(*The vector polynomials contains the input polynomials of the rewriting procedure described in Lemma 3. *)*)


(* ::Input:: *)
(*rewrite[structure_, sigma_, polynomials_]:= Module[*)
(*{k,n,t,endstate,leafpath,output,code,base},*)
(*k=Length[polynomials];(* this is the same k as in Lemma 3*)*)
(*n=Ceiling[Log2[k]]; (* this is the same n as in Lemma 3*)*)
(*t=Length[structure]-1; (* this is the same t as in Lemma 3*)*)
(*endstate=Table[0,{n+1}]; (* this represent the number t^n in base t*)*)
(*endstate[[n+1]]=1;*)
(*leafpath=Table[0,{n+1}];(* this represent the path from each leaf to the root of the tree described in Lemma 3*)*)
(*leafpath[[1]]=1;*)
(*If [sigma[[1]]==1,*)
(*base=1,*)
(*base=Min[2^n, k] ];*)
(*output=structure[[1]];*)
(*For[i=1,i<n,i++,output=output<>" "<>structure[[1]]];*)
(*output=output<>" "<>polynomials[[base]];*)
(*(* We write the initial symbols of the polynomial f_n and the polynomial p_1*)*)
(*If[n<=0, output=polynomials[[1]]; Return[output],*)
(*(* if there is only one input polynomial one just writes the variable*)*)
(*While[leafpath!=endstate, *)
(*(* We start a loop that runs on each leaf of the tree representing p described in the proof of Lemma 3. Leaves are number in base t*)*)
(*For[j=n+1,j>=1,j--,*)
(*If[leafpath[[j]]>0 && (j==1 ||Take[leafpath,{1,j-1}]==Take[endstate,{1,j-1}]),*)
(*(*This For loop and the If select the first non zero coefficient of the representation of the number of the leaf in base t*)*)
(*For[i=1,i<=j-1,i++, output= output<>" "<>structure[[t+1]]];*)
(*output=output<>" "<>structure[[leafpath[[j]]+1]];*)
(*For[i=1,i<=j-1,i++, output= output<>" "<>structure[[1]]];*)
(*(* First we write symbols from structure*)*)
(*base=Min[1+\!\( *)
(*\*UnderoverscriptBox[\(\[Sum]\), \(i = 1\), \(n\)]\(\((sigma[\([\)\(leafpath[\([\)\(i\)\(]\)] + 1\)\(]\)] - 1)\)*2^\((i - 1)\)\)\) ,k];*)
(*output=output<>" "<>polynomials[[base]];*)
(*(*we write an element from polynomials corresponding to the leaf considered at this iteration of the while loop*)*)
(*If[j!=1 , leafpath[[1]]=1,*)
(*If[ leafpath[[j]]!=t-1, leafpath[[j]]=leafpath[[j]]+1,*)
(*code=1;*)
(*While[code<=n+1, *)
(*If[leafpath[[code]]==t-1, *)
(*code=code+1,*)
(*For[h=1, h<code, h++, *)
(*leafpath[[h]]=0; *)
(*];*)
(*leafpath[[code]]=leafpath[[code]]+1;*)
(*code=n+3;*)
(*];*)
(*];*)
(*];*)
(*];*)
(*(*This part moves to the next leaf by adding one to the leaf number and computing the number in base t*)*)
(*];*)
(*];*)
(*];*)
(*];*)
(*For[i=1,i<=n,i++,output=output<>" "<>structure[[t+1]]];*)
(*output*)
(*]*)


(* ::Input:: *)
(**)
(*(* Here we report some trial test*)*)
(*(* We assume that the conjuction is induced by the polynomial *)
(*d(x, t(y,y), m(x,y))*)
(*where d is ternary, t and m are binary.*)
(**)*)
(*structure={"d(", "t(", "", ") m(", "", "))"}*)
(**)
(**)


(* ::Input:: *)
(*sigma={1,2,2,1,2}*)
(**)


(* ::Input:: *)
(*(*First we consider the case that k=1*)*)
(*rewrite[structure, sigma, {"y"}]*)


(* ::Input:: *)
(*(*Next we consider the case that k=3*)*)
(*polynomials={"y_1", "y_2", "t(y_1, y_3"}*)


(* ::Input:: *)
(*rewrite[structure, sigma, polynomials]*)


(* ::Input:: *)
(*(*Next we consider the case that the conjunction is induced by a frugal polynomial and k=8*)*)
(*rewrite[{" ", "V", " "},{1,2},{"x_1", "x_2", "x_3","x_4", "x_5", "x_6", "x_7", "x_8"}]*)


(* ::Input:: *)
(*(*Finally we consider a more caotic example*)*)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(*TimeConstrained[rewrite[{"c1","c2","c3","c4"},{1,2,2},{"x1","x2","x3","x4", "x5", "x6", "x7", "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15", "x16"}], 60]*)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(*    *)


(* ::Input:: *)
(**)


(* ::Print:: *)
(**)


(* ::Input:: *)
(**)
