(* ::Package:: *)

(* Examples *)

<<"/Users/ethan/Desktop/\:7269\:7406/sdpb/test4/SDPB.m";

(* The following is the example in the manual *)
(* Maximize {a,b}.{0,-1} = -b over {a,b} such that {a,b}.{1,0}=a=1 and 

E^(-x)(a(1+x^1.0) + b(x^4/12 + x^2)) >= 0 for all x>=0

Equivalently,

1+x^4 + b(x^4/12 + x^2) >= 0 for all x >= 0

The prefactor DampedRational[1,{},1/E,x] doesn't affect the answer,
but does affect the choice of sample scalings and bilinear basis.

*)
(*
b[x_,l_]:= Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2) LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}]/.{t -> 0}];
c[x_,l_]:= Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2)^2 LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}]/.{t -> 0}];
d[x_,l_]:= Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2)^3 LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}]/.{t -> 0}];
n[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(2*Floor[(k+q+1)/2]-1)*(x+3)^(k)*(x-1.0)^(l/2)*1/((q-1)!)(D[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(s-M^2)^(k-q) LegendreP[l,1+(2x t)/(x-M^2)^2], {s,M^2}],{t,q-1}]/.{t -> 0})]];
n[k_,q_,x_,l_]:=Expand[Simplify[1/((q-1)!)(D[Simplify[Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(M^2-s-t)^(q) LegendreP[l,1+(2x t)/(x-M^2)^2], {t,M^2-s}]+Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(M^2-s-t)^(q) LegendreP[l,1+(2x t)/(x-M^2)^2], {t,2M^2-s-x}]+Residue[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2)) *1/(M^2-s-t)^(q) LegendreP[l,1+(2x t)/(x-M^2)^2], {t,M^2-x}]],{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(2*Floor[(k+q+1)/2]-1)*(x+3)^(k)*(x-1.0)^(l/2)*1/((k-q-2)!)(D[Residue[1/(x-s)*1/x^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]]/(M^2-s-t)^(q+1),{s,M^2-t}],{t,k-q-2}]/.{t -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[1/((k-q)!)(D[Residue[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]]/(M^2-s-t)^(q+1),{s,M^2-t}]+Residue[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]]/(M^2-s-t)^(q+1),{s,x}],{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(2*Floor[(k+q+1)/2]-1)*(x+3)^(k)*(x-1.0)^(l/2)*1/((k-q-2)!)(D[Residue[1/((2-x-t)-s)*1/(2-x-t)^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]]/(M^2-s-t)^(q+1),{s,M^2-t}],{t,k-q-2}]/.{t -> M^2})]];
*)
(* one we are using *)
(*
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^q *1/((k-q-1)!)*1/((q)!)(D[D[(1/(x-s+1.0)+1/(x+s+t-2*M^2+1.0))1/((x-M^2+1.0)(x+t-M^2+1.0))LegendreP[l,1+(2(x+1.0) t)/(x-M^2+1.0)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^q *1/((k-q-1)!)*1/((q)!)(D[D[(1/(x-s+1.0)+1/(x+s+t-2*M^2+1.0))1/((x-M^2+1.0)(x+t-M^2+1.0))LegendreP[l,1+(2(x+1.0) t)/(x-M^2+1.0)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^q *1/((k-q)!)*1/((q)!)(D[D[1/(x-s+1.0)*1/(x+1.0)^2*s^2*LegendreP[l,(2t-2M^2+x+1.0)/Sqrt[(x+1.0)(x-4M^2+1.0)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^q *1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.0)-t)-s)*1/(2-(x+1.0)-t)^2*s^2*LegendreP[l,1+(2(x+1.0)t)/((x+1.0)-M^2)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
*)
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+1.0)+1/(x+s+t-2*M^2+1.0))*1/((x-M^2+1.0)(x+t-M^2+1.0))*LegendreP[l,1+(2(x+1.0) t)/(x-M^2+1.0)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*1/((k-q-1)!)*1/((q-1)!)(D[D[(1/(x-s+1.0)+1/(x+s+t-2*M^2+1.0))*1/((x-M^2+1.0)(x+t-M^2+1.0))*LegendreP[l,1+(2(x+1.0) t)/(x-M^2+1.0)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
(*m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s+1.0)*1/(x+1.0)^2*s^2*LegendreP[l,(2t-2M^2+x+1.0)/Sqrt[(x+1.0)(x-4M^2+1.0)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)
m[k_,q_,x_,l_]:=Refine[Re[Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/((x+1.0)-s)*1/((x+1.0))^2*s^2*LegendreP[l,(2t-2M^2+(x+1.0))/Sqrt[(x+1.0)(x+1.0-4M^2)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]]],Element[{x},Reals]];
(*l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.0)-t)-s)*1/(2-(x+1.0)-t)^2*s^2*LegendreP[l,1+(2*((x+1.0))*t)/((x+1.0)-M^2)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q+1)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.0)-t)-s)*1/(2-(x+1.0)-t)^2*s^2*LegendreP[l,1+(2*((x+1.0))*(2-(x+1.0)-t))/((x+1.0)-M^2)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
(*l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.0)-t)-s)*1/(2-(x+1.0)-t)^2*s^2*LegendreP[l,1+(2*(2-(x+1.0)-t)*t)/(2-(x+1.0)-M^2-t)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)


(*l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*1/((k-q)!)*1/((q)!)(D[D[1/((2-(x+1.0)-t)-s)*1/(2-(x+1.0)-t)^2*s^2*LegendreP[l,1+(2*(2-(x+1.0)-t)*t)/(2-(x+1.0)-M^2-t)^2],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];*)

(*
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-1.0)^(l/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-1.0)^(l/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-1.0)^(l/2)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-1.0)^(l/2)*1/((k-q)!)*1/((q)!)(D[D[1/((2-x-t)-s)*1/(2-x-t)^2*s^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
*)
(*
g[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-1.0)^(20/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
n[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q-1)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-1.0)^(20/2)*1/((k-q)!)*1/((q-1)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t \[Rule] M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-1.0)^(20/2)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[(-1)^(q)*x^(6+1)*(x-1)^(6+20+1)*(x+3)^(6-1+20/2)*(x-1.0)^(20/2)*1/((k-q)!)*1/((q)!)(D[D[1/((2-x-t)-s)*1/(2-x-t)^2*s^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]],{s,q}]/.{s \[Rule] M^2 - t},{t,k-q}]/.{t -> M^2})]];
*)
(*
(x+1.0)^(k+1)*(x-1+1.0)^(k+l+1)*(x+3+1.0)^(k-q+l/2)*(x)^(l/2)*
*)
M=1;

matA[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,m[5,2,f,J]/2,m[5,4,f,J]/2,m[6,2,f,J]/2,m[4,2,f,J]/2,m[6,3,f,J]/2,m[2,1,f,J]/2,m[7,2,f,J]/2,m[7,3,f,J]/2,m[3,1,f,J]/2,m[4,1,f,J]/2}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{g[5,1,f,J],g[2,1,f,J],g[5,2,f,J],n[5,2,f,J]-l[5,2,f,J],n[5,4,f,J]-l[5,4,f,J],n[6,2,f,J]-l[6,2,f,J],n[4,2,f,J]-l[4,2,f,J],n[6,3,f,J]-l[6,3,f,J],n[2,1,f,J]-l[2,1,f,J],n[7,2,f,J]-l[7,2,f,J],n[7,3,f,J]-l[7,3,f,J],n[3,1,f,J]-l[3,1,f,J],n[4,1,f,J]-l[4,1,f,J]},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,m[5,2,f,J]/2,m[5,4,f,J]/2,m[6,2,f,J]/2,m[4,2,f,J]/2,m[6,3,f,J]/2,m[2,1,f,J]/2,m[7,2,f,J]/2,m[7,3,f,J]/2,m[3,1,f,J]/2,m[4,1,f,J]/2},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}}};
matB[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{g[5,1,f,J],g[2,1,f,J],g[5,2,f,J],n[5,2,f,J]-l[5,2,f,J],n[5,4,f,J]-l[5,4,f,J],n[6,2,f,J]-l[6,2,f,J],n[4,2,f,J]-l[4,2,f,J],n[6,3,f,J]-l[6,3,f,J],n[2,1,f,J]-l[2,1,f,J],n[7,2,f,J]-l[7,2,f,J],n[7,3,f,J]-l[7,3,f,J],n[3,1,f,J]-l[3,1,f,J],n[4,1,f,J]-l[4,1,f,J]},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}}};
MatCombine[f_]:=Fold[ArrayFlatten[{{#,{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},#2}}]&,{matA[0,f],matB[1,f],matA[2,f],matB[3,f],matA[4,f],matB[5,f],matA[6,f],matB[7,f],matA[8,f],matB[9,f]}];
matC[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,m[5,2,f,J]/2,m[5,4,f,J]/2,m[6,2,f,J]/2,m[4,2,f,J]/2,m[6,3,f,J]/2,m[2,1,f,J]/2,m[7,2,f,J]/2,m[7,3,f,J]/2,m[3,1,f,J]/2,m[4,1,f,J]/2}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,m[5,2,f,J]/2,m[5,4,f,J]/2,m[6,2,f,J]/2,m[4,2,f,J]/2,m[6,3,f,J]/2,m[2,1,f,J]/2,m[7,2,f,J]/2,m[7,3,f,J]/2,m[3,1,f,J]/2,m[4,1,f,J]/2},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}}};
matD[J_, f_]:={{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0}}};
MatCombine2[f_]:=Fold[ArrayFlatten[{{#,{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},#2}}]&,{matC[0,f],matD[1,f],matC[2,f],matD[3,f],matC[4,f],matD[5,f],matC[6,f],matD[7,f],matC[8,f],matD[9,f]}];
MatCombine3[f_]:=Fold[ArrayFlatten[{{#,{0,0,0,0,0,0,0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0,0,0,0,0,0,0},#2}}]&,{matB[0,f],matB[1,f],matB[2,f],matB[3,f],matB[4,f],matB[5,f],matB[6,f],matB[7,f],matB[8,f],matB[9,f]}];
Polyp[f_]:={

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine[f]]};
        
Polyp3[f_]:=

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine[f]];

Polyp4[f_]:=

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine2[f]];   
             
Polyp5[f_]:=

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],MatCombine3[f]]; 
                  
Polyp2[f_]:={

        PositiveMatrixWithPrefactor[

        DampedRational[1,{},1/E,x],Sum[MatCombine[x],{x,4,f}]+MatCombine[1]+MatCombine[2]]};

      
SDP[datfile_] := Module[

    {
   
		
        pols = {
        (*Polyp4[-2],*)
        Polyp4[0],
        Polyp3[1],
		Polyp3[2],
		Polyp5[3],
		Polyp3[4],
		Polyp3[5],
		Polyp3[6],
		Polyp3[7],
		Polyp3[8],
		Polyp3[9],
		Polyp3[10],
		Polyp3[11],
		Polyp3[12],
		Polyp3[13],
		Polyp3[14],
		Polyp3[15](*,
		Polyp3[16],
		Polyp3[17],
		Polyp3[18],
		Polyp3[19],
		Polyp3[20],
		Polyp3[21],
		Polyp3[22],
		Polyp3[23],
		Polyp3[24],
		Polyp3[25],
		Polyp3[26],
		Polyp3[27],
		Polyp3[28],
		Polyp3[29],
		Polyp3[30],
		Polyp3[31],
		Polyp3[32],
		Polyp3[33],
		Polyp3[34],
		Polyp3[35],
		Polyp3[36],
		Polyp3[37],
		Polyp3[38],
		Polyp3[39],
		Polyp3[40],
		Polyp3[41],
		Polyp3[42],
		Polyp3[43],
		Polyp3[44],
		Polyp3[45]*)
        },

        (*pols = Polyp2[20],*)
		norm = {0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        obj  = {10, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

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
