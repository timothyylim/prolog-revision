{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf130
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 % 1. subList(L1, L2) \
% to mean every element in list L1 is also in list L2.\
% subList([1,2,3], [1,1,3,2,3,4]) \
% and subList([1,1,4,3], [5,1,3,2,3,4]) should both succeed.\
\
subList([],_).\
\
subList([H|T],L):-\
    member(H,L),\
    subList(T,L).\
\
\
\
% 2. difference(L1, L2, L) \
% to mean L consists of all the elements in L1 that are not in L2.\
% difference([1,1,2,3, 5, 5], [1,3,2, 3,4], L) should give L=([5, 5]. \
\
% Note that this could be done much easier with findall \
% but the following is meant to be an explanation of accumalators\
\
difference(L1,L2,L):-\
    differenceAcc(L1,L2,[],L).\
\
differenceAcc([],_,D,D).\
\
differenceAcc([H|T],L,DAcc,D):-\
    \\+member(H,L),\
    append([H],DAcc,DAccnew),\
    differenceAcc(T,L,DAccnew,D).\
\
differenceAcc([H|T],L,DAcc,D):-\
    member(H,L),\
    differenceAcc(T,L,DAcc,D).\
\
\
% 3. sift(L, N, Result) \
% to mean Result is list L but with all occurrences of elements \
% greater than N\
% sift([1,4,3,6,8], 3, X) should give X=[1,3].\
\
% Note that this could be done much easier with findall \
% but the following is meant to be an explanation of accumalators\
\
sift(L,N,Result):-\
    siftAcc(L,N,[],Result).\
\
siftAcc([],_,R,Result):-\
    reverse(R,Result).\
\
siftAcc([H|T],N,ResAcc, Result):-\
    H =< N,\
    append([H],ResAcc,ResAccnew),\
    siftAcc(T,N,ResAccnew,Result).\
\
siftAcc([H|T],N,ResAcc, Result):-\
    H > N,\
    siftAcc(T,N,ResAcc,Result).\
\
% 4. common(L1, L2, I)\
% to mean I is the list of the common elements of lists L1 and L2.\
% common([1,1,4,2,5], [1,1,7,2,3,4,4,8], I) \
% should give the answer I=[1,2,4].\
% common([1,2], [4,8], I) should give the answer I=[].\
\
common(L1,L2,I):-\
    findall(E,(member(E,L1),member(E,L2)),Unsorted),\
    sort(Unsorted,I).\
\
% 5. delete(L, Result)\
% delete([1,2,3,4], R) should give the answer R=[1,3].\
\
delete([], []).\
\
delete([X], [X]).\
\
delete([H,_|T], [H|Result]) :- \
    delete(T, Result).\
\
\
% 7. split(L, N, L1, L2)\
% Split a list L into two parts L1 and L2 \
% such that the length of the first part is N.\
\
split(L,N,L1,L2):-\
    append(L1,L2,L),\
    length(L1,Len),\
    Len is N.\
\
% 8. drop(L, N, Result) Drop every N'th element from a list L.\
\
drop(L1,N,L2) :- drop(L1,N,L2,N).\
\
drop([],_,[],_).\
\
drop([_|Xs],N,Ys,1) :- \
    drop(Xs,N,Ys,N).\
\
drop([X|Xs],N,[X|Ys],K) :- \
    K > 1, \
    K1 is K - 1, \
    drop(Xs,N,Ys,K1).\
\
\
    \
    \
\
\
\
\
\
    \
\
\
\
\
\
\
\
\
\
\
\
}