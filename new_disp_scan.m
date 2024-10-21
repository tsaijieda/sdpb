(* ::Package:: *)

(* Examples *)

<<"/Users/ethan/Desktop/\:7269\:7406/sdpb/test4/SDPB.m";

(* The following is the example in the manual *)
(* Maximize {a,b}.{0,-1} = -b over {a,b} such that {a,b}.{1,0}=a=1 and 

E^(-x)(a(1+x^1.5) + b(x^4/12 + x^2)) >= 0 for all x>=0

Equivalently,

1+x^4 + b(x^4/12 + x^2) >= 0 for all x >= 0

The prefactor DampedRational[1,{},1/E,x] doesn't affect the answer,
but does affect the choice of sample scalings and bilinear basis.

*)
(*
b[x_,l_]:= Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2) LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}]/.{t -> 0}];
c[x_,l_]:= Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2)^2 LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}]/.{t -> 0}];
d[x_,l_]:= Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2)^3 LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}]/.{t -> 0}];
n[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(2*Floor[(k+q+1)/2]-1)*(x+3)^(k)*(x-1.5)^(l/2)*1/((q-1)!)(D[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2)^(k-q) LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}],{t,q-1}]/.{t -> 0})]];
n[k_,q_,x_,l_]:=Expand[Simplify[1/((q-1)!)(D[Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(M^2-s-t)^(q) LegendreP[l,1+(2x t)/(x-M^2)^2], {t,M^2-s}]+Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(M^2-s-t)^(q) LegendreP[l,1+(2x t)/(x-M^2)^2], {t,2M^2-s-x}]+Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(M^2-s-t)^(q) LegendreP[l,1+(2x t)/(x-M^2)^2], {t,M^2-x}]],{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(2*Floor[(k+q+1)/2]-1)*(x+3)^(k)*(x-1.5)^(l/2)*1/((k-q-2)!)(D[Residue[1/(x-s)*1/x^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]]/(M^2-s-t)^(q+1),{s,M^2-t}],{t,k-q-2}]/.{t -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[1/((k-q)!)(D[Residue[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]]/(M^2-s-t)^(q+1),{s,M^2-t}]+Residue[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]]/(M^2-s-t)^(q+1),{s,x}],{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(2*Floor[(k+q+1)/2]-1)*(x+3)^(k)*(x-1.5)^(l/2)*1/((k-q-2)!)(D[Residue[1/((2-x-t)-s)*1/(2-x-t)^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]]/(M^2-s-t)^(q+1),{s,M^2-t}],{t,k-q-2}]/.{t -> M^2})]];
*)
(* one we are using *)
(*
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^q *1/((k-q-1)!)*1/((q)!)(D[D[(1/(x-s+1.5)+1/(x+s+t-2*M^2+1.5))1/((x-M^2+1.5)(x+t-M^2+1.5))LegendreP[l,1+(2(x+1.5) t)/(x-M^2+1.5)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^q *1/((k-q-1)!)*1/((q)!)(D[D[(1/(x-s+1.5)+1/(x+s+t-2*M^2+1.5))1/((x-M^2+1.5)(x+t-M^2+1.5))LegendreP[l,1+(2(x+1.5) t)/(x-M^2+1.5)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^q *1/((k-q)!)*1/((q)!)(D[D[1/(x-s+1.5)*1/(x+1.5)^2*s^2*LegendreP[l,(2t-2M^2+x+1.5)/Sqrt[(x+1.5)(x-4M^2+1.5)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^q *1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.5)-t)-s)*1/(2-(x+1.5)-t)^2*s^2*LegendreP[l,1+(2(x+1.5)t)/((x+1.5)-M^2)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
*)
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+1.5)+1/(x+s+t-2*M^2+1.5))*1/((x-M^2+1.5)(x+t-M^2+1.5))*LegendreP[l,1+(2(x+1.5) t)/(x-M^2+1.5)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+1.5)+1/(x+s+t-2*M^2+1.5))*1/((x-M^2+1.5)(x+t-M^2+1.5))*LegendreP[l,1+(2(x+1.5) t)/(x-M^2+1.5)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
(*m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s+1.5)*1/(x+1.5)^2*s^2*LegendreP[l,(2t-2M^2+x+1.5)/Sqrt[(x+1.5)(x-4M^2+1.5)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)
m[k_,q_,x_,l_]:=Refine[Re[Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/((x+1.5)-s)*1/((x+1.5))^2*s^2*LegendreP[l,(2t-2M^2+(x+1.5))/Sqrt[(x+1.5)(x+1.5-4M^2)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]]],Element[{x},Reals]];
(*l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.5)-t)-s)*1/(2-(x+1.5)-t)^2*s^2*LegendreP[l,1+(2*((x+1.5))*t)/((x+1.5)-M^2)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.5)-t)-s)*1/(2-(x+1.5)-t)^2*s^2*LegendreP[l,1+(2*((x+1.5))*(2-(x+1.5)-t))/((x+1.5)-M^2)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
(*l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.5)-t)-s)*1/(2-(x+1.5)-t)^2*s^2*LegendreP[l,1+(2*(2-(x+1.5)-t)*t)/(2-(x+1.5)-M^2-t)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)


(*l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.5)-t)-s)*1/(2-(x+1.5)-t)^2*s^2*LegendreP[l,1+(2*(2-(x+1.5)-t)*t)/(2-(x+1.5)-M^2-t)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)

(*
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-1.5)^(l/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-1.5)^(l/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-1.5)^(l/2)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-1.5)^(l/2)*1/((k-q)!)*1/((q)!)(D[D[1/((2-x-t)-s)*1/(2-x-t)^2*s^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
*)
(*
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-1.5)^(20/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-1.5)^(20/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-1.5)^(20/2)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-1.5)^(20/2)*1/((k-q)!)*1/((q)!)(D[D[1/((2-x-t)-s)*1/(2-x-t)^2*s^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
*)
(*
(x+1.5)^(k+1)*(x-1+1.5)^(k+l+1)*(x+3+1.5)^(k-q+l/2)*(x)^(l/2)*
*)
M=1;

matA[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,m[5,2,f,J],m[5,4,f,J],m[6,2,f,J],m[8,2,f,J],m[6,3,f,J],m[8,4,f,J],m[7,2,f,J],m[7,3,f,J],m[9,2,f,J],m[9,3,f,J]}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{g[4,1,f,J],g[3,1,f,J],g[4,2,f,J],n[5,2,f,J]-l[5,2,f,J],n[5,4,f,J]-l[5,4,f,J],n[6,2,f,J]-l[6,2,f,J],n[8,2,f,J]-l[8,2,f,J],n[6,3,f,J]-l[6,3,f,J],n[8,4,f,J]-l[8,4,f,J],n[7,2,f,J]-l[7,2,f,J],n[7,3,f,J]-l[7,3,f,J],n[9,2,f,J]-l[9,2,f,J],n[9,3,f,J]-l[9,3,f,J]},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}}};
matB[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{g[4,1,f,J],g[3,1,f,J],g[4,2,f,J],n[5,2,f,J]-l[5,2,f,J],n[5,4,f,J]-l[5,4,f,J],n[6,2,f,J]-l[6,2,f,J],n[8,2,f,J]-l[8,2,f,J],n[6,3,f,J]-l[6,3,f,J],n[8,4,f,J]-l[8,4,f,J],n[7,2,f,J]-l[7,2,f,J],n[7,3,f,J]-l[7,3,f,J],n[9,2,f,J]-l[9,2,f,J],n[9,3,f,J]-l[9,3,f,J]},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}}};
MatCombine[f_]:=Fold[ArrayFlatten[{{#,{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},#2}}]&,{matA[0,f],matB[1,f],matA[2,f],matB[3,f],matA[4,f],matB[5,f],matA[6,f],matB[7,f],matA[8,f]}];

Polyp[f_]:={

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine[f]]};
        
Polyp3[f_]:=

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine[f]];
        
        
Polyp2[f_]:={

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],Sum[MatCombine[x],{x,4,f}]+MatCombine[1]+MatCombine[2]]};

      
SDP[datfile_] := Module[

    {
   
		
        pols = {
        Polyp3[0.01],
        Polyp3[0.1],
        Polyp3[0.3],
        Polyp3[0.4],
        Polyp3[0.5],
        Polyp3[0.6],
        Polyp3[0.7],
        Polyp3[1],
        Polyp3[1.5],
        Polyp3[2],
        Polyp3[3.5],
        Polyp3[4.5],
        Polyp3[5.5],
        Polyp3[6.5],
        Polyp3[7.5],       
        Polyp3[8.5], 
        Polyp3[9.5], 
        Polyp3[10.5] 
        },

        (*pols = Polyp2[20],*)
		norm = {0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        obj  = {10000, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

    },
 
    

(*
{pols={PositiveMatrixWithPrefactor[DampedRational[1,{},1/E,x],{{{1+x^4,x^4/12+x^2}}}]},norm={1,0},obj={0,-1}},
*)
    (*Print[pols];*)
    Print[norm];
    Print[obj];
    WriteBootstrapSDP[datfile, SDP[obj, norm, pols]];]

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
