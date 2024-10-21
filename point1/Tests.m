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

n[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-4)^(l/2)*1/((k-q)!)*1/((q)!)(D[D[(1/(x-s)+1/(x+s+t-2*M^2))1/((x-M^2)(x+t-M^2))LegendreP[l,1+(2x t)/(x-M^2)^2],{t,q-1}]/.{t -> M^2 - s},{s,k-q-1}]/.{s -> M^2})]];
m[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-4)^(l/2)*1/((k-q)!)*1/((q)!)(D[D[1/(x-s)*1/x^2*s^2*LegendreP[l,(2t-2M^2+x)/Sqrt[x(x-4M^2)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
l[k_,q_,x_,l_]:=Expand[Simplify[x^(k+1)*(x-1)^(k+l+1)*(x+3)^(k-q+l/2)*(x-4)^(l/2)*1/((k-q)!)*1/((q)!)(D[D[1/((2-x-t)-s)*1/(2-x-t)^2*s^2*LegendreP[l,(2t-2M^2+(2-x-t))/Sqrt[(2-x-t)((2-x-t)-4M^2)]],{s,q}]/.{s -> M^2 - t},{t,k-q}]/.{t -> M^2})]];
M=1;
SDP[datfile_] := Module[

    {
   
		
   
        pols = 
        
        
       {
        (*
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-m[3,2,x,2],-m[4,3,x,2]}},{{0,0,0,0},{n[4,1,x,2],n[3,1,x,2],n[3,2,x,2],n[4,3,x,2]},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-m[3,2,x,4],-m[4,3,x,4]}},{{0,0,0,0},{n[4,1,x,4],n[3,1,x,4],n[3,2,x,4],n[4,3,x,4]},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-m[3,2,x,6],-m[4,3,x,6]}},{{0,0,0,0},{n[4,1,x,6],n[3,1,x,6],n[3,2,x,6],n[4,3,x,6]},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-m[3,2,x,8],-m[4,3,x,8]}},{{0,0,0,0},{n[4,1,x,8],n[3,1,x,8],n[3,2,x,8],n[4,3,x,8]},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-m[3,2,x,10],-m[4,3,x,10]}},{{0,0,0,0},{n[4,1,x,10],n[3,1,x,10],n[3,2,x,10],n[4,3,x,10]},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-m[3,2,x,12],-m[4,3,x,12]}},{{0,0,0,0},{n[4,1,x,12],n[3,1,x,12],n[3,2,x,12],n[4,3,x,12]},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-m[3,2,x,14],-m[4,3,x,14]}},{{0,0,0,0},{n[4,1,x,14],n[3,1,x,14],n[3,2,x,14],n[4,3,x,14]},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-l[3,2,x,2],-l[4,3,x,2]}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-l[3,2,x,4],-l[4,3,x,4]}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-l[3,2,x,6],-l[4,3,x,6]}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-l[3,2,x,8],-l[4,3,x,8]}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-l[3,2,x,10],-l[4,3,x,10]}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-l[3,2,x,12],-l[4,3,x,12]}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-l[3,2,x,14],-l[4,3,x,14]}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}]
        *)
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,-m[3,2,x,2],-m[4,3,x,2],0,0,0}},{{0,0,0,0,0,0,0},{n[4,1,x,2],n[3,1,x,2],n[3,2,x,2],n[4,3,x,2],0,0,0},{0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,0,0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,-m[3,2,x,2],-m[4,3,x,2],0,0,0}},{{0,0,0,0,0,0,0},{n[4,1,x,2],n[3,1,x,2],n[3,2,x,2],n[4,3,x,2],0,0,0},{0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,0,0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,-m[3,2,x,2],-m[4,3,x,2],0,0,0}},{{0,0,0,0,0,0,0},{n[4,1,x,2],n[3,1,x,2],n[3,2,x,2],n[4,3,x,2],0,0,0},{0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,0,0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,-m[3,2,x,2],-m[4,3,x,2],0,0,0}},{{0,0,0,0,0,0,0},{n[4,1,x,2],n[3,1,x,2],n[3,2,x,2],n[4,3,x,2],0,0,0},{0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,0,0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,-m[3,2,x,2],-m[4,3,x,2],0,0,0}},{{0,0,0,0,0,0,0},{n[4,1,x,2],n[3,1,x,2],n[3,2,x,2],n[4,3,x,2],0,0,0},{0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,0,0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,-m[3,2,x,2],-m[4,3,x,2],0,0,0}},{{0,0,0,0,0,0,0},{n[4,1,x,2],n[3,1,x,2],n[3,2,x,2],n[4,3,x,2],0,0,0},{0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,0,0,0,0,0}}}],
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,-m[3,2,x,2],-m[4,3,x,2],0,0,0}},{{0,0,0,0,0,0,0},{n[4,1,x,2],n[3,1,x,2],n[3,2,x,2],n[4,3,x,2],0,0,0},{0,0,0,0,0,0,0}},{{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,0,0,0,0,0}}}]        
        (*
        ,
        
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,-m[3,1,x,1],-m[4,1,x,1]}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}]       
        *)
        (*
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,(3/2048-(9*x)/4096+(63*x^2)/32768-(21*x^3)/16384+(189*x^4)/262144-(189*x^5)/524288+(693*x^6)/4194304-(297*x^7)/4194304+(3861*x^8)/134217728-(3003*x^9)/268435456+(9009*x^10)/2147483648),(-(3/2048)+(21*x)/8192-(21*x^2)/8192+(63*x^3)/32768-(315*x^4)/262144+(693*x^5)/1048576-(693*x^6)/2097152+(1287*x^7)/8388608-(9009*x^8)/134217728+(15015*x^9)/536870912-(3003*x^10)/268435456)}},{{0,0,0,0},{-2-6*x-12*x^2-20*x^3-30*x^4-42*x^5-56*x^6-72*x^7-90*x^8-110*x^9-132*x^10,3+12*x+30*x^2+60*x^3+105*x^4+168*x^5+252*x^6+360*x^7+495*x^8+660*x^9+858*x^10,3+12*x+30*x^2+60*x^3+105*x^4+168*x^5+252*x^6+360*x^7+495*x^8+660*x^9+858*x^10,-8-40*x-120*x^2-280*x^3-560*x^4-1008*x^5-1680*x^6-2640*x^7-3960*x^8-5720*x^9-8008*x^10},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}],
        
        PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{{{0,0,0,0},{0,0,0,0},{0,0,(3/2048-(9*x)/4096+(63*x^2)/32768-(21*x^3)/16384+(189*x^4)/262144-(189*x^5)/524288+(693*x^6)/4194304-(297*x^7)/4194304+(3861*x^8)/134217728-(3003*x^9)/268435456+(9009*x^10)/2147483648),(-(3/2048)+(21*x)/8192-(21*x^2)/8192+(63*x^3)/32768-(315*x^4)/262144+(693*x^5)/1048576-(693*x^6)/2097152+(1287*x^7)/8388608-(9009*x^8)/134217728+(15015*x^9)/536870912-(3003*x^10)/268435456)}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{0,0,0,0},{0,0,0,0},{0,0,0,0}}}]
        *)
        
        },
        
   
        
  (*
    
        pols ={{{PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{1+x^4,1+x^2+x^4/12}],PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{x^2,x/5}]},
       {PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{x^2,x/5}],PositiveMatrixWithPrefactor[
        DampedRational[1,{},1/E,x],{2+x^4,2 x^2+x^4/3}]}}},
  *)
        
      
        norm = {0, 1, 0, 0, 0, 0, 0},
        obj  = {1, 0, 0, 0, 0, 0, 0}
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
        obj  = {0, -1}
    },

    WriteBootstrapSDP[datFile, SDP[obj, norm, pols]];];
    *)
