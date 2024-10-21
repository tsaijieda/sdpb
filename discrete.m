(* ::Package:: *)

(* Examples *)

<<"/Users/ethan/Desktop/\:7269\:7406/sdpb/test4/SDPB.m";

(* The following is the example in the manual *)
(* Maximize {a,b}.{0,-1} = -b over {a,b} such that {a,b}.{1,0}=a=1 and 

E^(-x)(a(1+x^4) + b(x^4/12 + x^2)) >= 0 for all x>=0

Equivalently,

1+x^4 + b(x^4/12 + x^2) >= 0 for all x >= 0

The prefactor DampedRational[1,{},1/E,x] doesn't affect the answer,
but does affect the choice of sample scalings and bilinear basis.

*)
(*
b[x_,l_]:= Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2) LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}]/.{t -> 0}];
c[x_,l_]:= Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2)^2 LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}]/.{t -> 0}];
d[x_,l_]:= Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2)^3 LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}]/.{t -> 0}];
n[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(2*Floor[(k+q+1)/2]-1)*(x+3)^(k)*(x-4)^(l/2)*1/((q-1)!)(D[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2)^(k-q) LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}],{t,q-1}]/.{t -> 0})]];
n[k_,q_,x_,l_]:=Expand[Simplify[1/((q-1)!)(D[Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(M^2-s-t)^(q) LegendreP[l,1+(2x t)/(x-M^2)^2], {t,M^2-s}]+Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(M^2-s-t)^(q) LegendreP[l,1+(2x t)/(x-M^2)^2], {t,2M^2-s-x}]+Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(M^2-s-t)^(q) LegendreP[l,1+(2x t)/(x-M^2)^2], {t,M^2-x}]],{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(2*Floor[(k+q+1)/2]-1)*(x+3)^(k)*(x-4)^(l/2)*1/((k-q-2)!)(D[Residue[1/(x-s)*1/x^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]]/(M^2-s-t)^(q+1),{s,M^2-t}],{t,k-q-2}]/.{t -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[1/((k-q)!)(D[Residue[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]]/(M^2-s-t)^(q+1),{s,M^2-t}]+Residue[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]]/(M^2-s-t)^(q+1),{s,x}],{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(2*Floor[(k+q+1)/2]-1)*(x+3)^(k)*(x-4)^(l/2)*1/((k-q-2)!)(D[Residue[1/((2-x-t)-s)*1/(2-x-t)^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]]/(M^2-s-t)^(q+1),{s,M^2-t}],{t,k-q-2}]/.{t -> M^2})]];
*)
(* one we are using *)

(*g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+4)+1/(x+s+t-2*M^2+1))*1/((x-M^2+4)(x+t-M^2+4))*LegendreP[l,1+(2(x+4) t)/(x-M^2+4)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];*)
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+1.01)+1/(x+s+t-2*M^2+1))*1/((x-M^2+1.01)(x+t-M^2+1.01))*LegendreP[l,1+(2(x+1.01) t)/(x-M^2+1.01)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+4)+1/(x+s+t-2*M^2+4))*1/((x-M^2+4)(x+t-M^2+4))*LegendreP[l,1+(2(x+4) t)/(x-M^2+4)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s+4)*1/(x+4)^2*s^2*LegendreP[l,(2t-2M^2+x+4)/Sqrt[(x+4)(x-4M^2+4)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+4)-t)-s)*1/(2-(x+4)-t)^2*s^2*LegendreP[l,1+(2*((x+4))*t)/((x+4)-M^2)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
(*l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+4)-t)-s)*1/(2-(x+4)-t)^2*s^2*LegendreP[l,1+(2(x+4) t)/(x-M^2+4)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)
(*l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+4)-t)-s)*1/(2-(x+4)-t)^2*s^2*LegendreP[l,1+(2*(2-(x+4)-t)*t)/(2-(x+4)-M^2-t)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)
(*
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-4)^(l/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-4)^(l/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-4)^(l/2)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-4)^(l/2)*1/((k-q)!)*1/((q)!)(D[D[1/((2-x-t)-s)*1/(2-x-t)^2*s^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
*)
(*
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-4)^(20/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-4)^(20/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-4)^(20/2)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-4)^(20/2)*1/((k-q)!)*1/((q)!)(D[D[1/((2-x-t)-s)*1/(2-x-t)^2*s^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
*)
(*
(x+4)^(k+1)*(x-1+4)^(k+l+1)*(x+3+4)^(k-q+l/2)*(x)^(l2)*,matB[1,f],matB[2,f],matB[3,f],matB[4,f],matB[5,f],matB[6,f]
,matA[7,f],matA[8,f],matA[9,f],matA[10,f],matA[11,f],matA[12,f]
*)
M=1;
(*matA[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,-m[5,2,f,J],-m[5,4,f,J],-m[6,2,f,J],-m[8,2,f,J],-m[6,3,f,J],-m[8,4,f,J],-m[7,2,f,J],-m[7,3,f,J],-m[9,2,f,J],-m[9,3,f,J]}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{g[3,1,f,J],g[4,2,f,J],g[2,1,f,J],n[5,2,f,J],n[5,4,f,J],n[6,2,f,J],n[8,2,f,J],-n[6,3,f,J],n[8,4,f,J],n[7,2,f,J],n[7,3,f,J],n[9,2,f,J],n[9,3,f,J]},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}}};*)
matA[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,-m[5,2,f,J],-m[5,4,f,J],-m[6,2,f,J],-m[8,2,f,J],-m[6,3,f,J],-m[8,4,f,J],-m[7,2,f,J],-m[7,3,f,J],-m[9,2,f,J],-m[9,3,f,J]}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{g[4,1,f,J],g[3,1,f,J],g[4,2,f,J],n[5,2,f,J]+l[5,2,f,J],n[5,4,f,J]+l[5,4,f,J],n[6,2,f,J]+l[6,2,f,J],n[8,2,f,J]+l[8,2,f,J],n[6,3,f,J]+l[6,3,f,J],n[8,4,f,J]+l[8,4,f,J],n[7,2,f,J]+l[7,2,f,J],n[7,3,f,J]+l[7,3,f,J],n[9,2,f,J]+l[9,2,f,J],n[9,3,f,J]+l[9,3,f,J]},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}}};
matB[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,-l[5,2,f,J],-l[5,4,f,J],-l[6,2,f,J],-l[8,2,f,J],-l[6,3,f,J],-l[8,4,f,J],-l[7,2,f,J],-l[7,3,f,J],-l[9,2,f,J],-l[9,3,f,J]}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}}};
MatCombine[f_]:=Fold[ArrayFlatten[{{#,{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},#2}}]&,{matA[1,f],matA[2,f],matA[3,f],matA[4,f],matA[5,f],matA[6,f],matA[7,f],matA[8,f]}];
Polyp[f_]:={

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine[f]]}

      
SDP[datfile_] := Module[

    {
   
		
   
        (*pols = Flatten[Transpose[{Polyp[0.0001],Polyp[0.001],Polyp[0.01],Polyp[0.1],Polyp[1],Polyp[2],Polyp[3],Polyp[4], Polyp[5], Polyp[6], Polyp[7], Polyp[8], Polyp[10], Polyp[15], Polyp[20], Polyp[50], Polyp[100], Polyp[200], Polyp[500], Polyp[1000], Polyp[10000]}]],*)   
		pols = Flatten[Transpose[{Polyp[0.00000000001], Polyp[0.0000000001], Polyp[0.000000001], Polyp[0.00000001], Polyp[0.0000001],Polyp[0.000001],Polyp[0.00001],Polyp[0.0001],Polyp[0.001],Polyp[0.01],Polyp[0.1],Polyp[1],Polyp[2],Polyp[3],Polyp[4], Polyp[5], Polyp[6], Polyp[7], Polyp[8], Polyp[10], Polyp[15], Polyp[20], Polyp[50], Polyp[100], Polyp[200], Polyp[500], Polyp[1000], Polyp[10000], Polyp[100000], Polyp[1000000], Polyp[10000000], Polyp[100000000], Polyp[1000000000], Polyp[10000000000], Polyp[100000000000],Polyp[1000000000000],Polyp[10000000000000],Polyp[100000000000000]}]],
		norm = {0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        obj  = {-0.00016, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    },
   
    

(*
{pols={PositiveMatrixWithPrefactor[DampedRational[1,{},1/E,x],{{{1+x^4,x^4/12+x^2}}}]},norm={1,0},obj={0,-1}},
*)
    WriteBootstrapSDP[datfile, SDP[obj, norm, pols]];];

SDP["/Users/ethan/Desktop/\:7269\:7406/sdpb/test4/new.xml"]
(* A similar computation to the above, except with nontrivial matrix semidefiniteness constraints *)
(*
testSDPMatrix[datFile_] := Module[
    {
        pols = {
            PositiveMatrixWithPrefactor[
                DampedRational[1, {}, 1/E, x],
                {{{1 + x^4, 1 + x^4/12 + x^2}, {x^2,     x/5}},
                 {{x^2,     x/5},              {2 + x^4, x^4/3 + 2*x^2}}}],
            PositiveMatrixWithPrefactor[
                DampedRational[1, {}, 1/E, x],
                {{{1 + 3x^4/4, 1 + x^4/12 + x^2}, {x^2,     1/2 + x/5}},
                 {{x^2,     1/2 + x/5},        {2 + 3x^4/5, x^4/3 + 2*x^2}}}]
        },
        norm = {1, 0},
        obj  = {0, -1}$Failed
    },

    WriteBootstrapSDP[datFile, SDP[obj, norm, pols]];];
    *)
