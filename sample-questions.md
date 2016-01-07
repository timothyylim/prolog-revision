#Sample Questions

These are sample questions collected from a variety of places and compiled into one file. You can find the sources at the bottom.



---

Get last element of a list
```
my_last(X,[X]).

my_last(X,[_|L]) :- my_last(X,L).
```

Define member/2

```
member(X,[X|_]).
member(X, [_|T]):-
  member(X,T).
```

Define append/3

```
append([], L, L).
append([H|T], L2, [H|L3]):-
  append(T, L2, L3).
```

Define prefix/2
```
prefix(P,L):- append(P,_,L).
```

Define suffix/2
```
suffix(S,L):- append(_,S,L).
```

Define sublist/2
```
sublist(SubList,L):-
  suffix(S,L),
  prefix(SubList, S).
```

Define second/2

* second(X,L) where X is the second element of list L
```
second(X, [_,X|_]).
```

Find the length of a list without an accumulator 
* len(L,N) where N is length of the list 
```
len([],0).
len([_|T], N):-
  len(T, N),
  N is Nnew + 1.
```

Find the length of a list with an accumulator
```
len(L,N):- len(L,0,N).

len([],A,A).
len([_|T], Acc, N):-
  AccNew is Acc + 1,
  len(T,AccNew, N).
```

Double every element of a list
*twice(L1,L2) where [a,4] --> [a,a,4,4]
```
twice ([],[]).
twice([Ha|Ta],[Ha,Ha|Tb]):- twice(Ta,Tb).
```

Define sort 
* sort(L1,L2) where L2 is a sorted version of L1
```
mysort(L,SL):-
    setof(X,member(X,L),SL). 
```

Reverse a list using append
```
rev([],[]).

rev([H|T], R):-
  append(RTail, [H], R),
  rev(T,RTail).
```

Reverse a list using an accumulator
```
rev(L,R):- revAcc(L,[],R).

revAcc([],A,A).

revAcc([H|T], Acc, R):-
  revAcc(T, [H|A], R). 
```

Define followedby(X,Y,L)
* X is followed by Y in list L
```
followedby(X,Y,L):- append(_,[X,Y|_], L).
```

Define biggerof(X,Y,Z)
* Z is X is if X is bigger than Y and vice versa 
```
biggerof(X,Y,X):- X >= Y.
biggerof(X,Y,Y):- Y > X.
```

Penultimate
* penultimate(X,L) where X is the second last item in list L
```
penultimate(X,[X,_]).

penultimate(X, [_,Y|Ys]):-
  penultimate(X, [Y|Ys]).
```

Find the greatest integer in a list
* max(X,L) 
```
max(X,[X]).

max(X,[Y,Z|T]):-
  Y =< Z,
  max(X, [Z|T]).

max(X, [Y,Z|T]):-
  Y > Z,
  max(X, [Y|T]).
```

Find the greatest integer in a list using an accumulator
* max(X,L) 
```
max(X,L):- max(X,0,L).

max([],A,A).

max([H|T], Acc, Max):-
  H > Acc,
  max(T, H, Max).
 
max([H|T], Acc, Max):-
  H < Acc,
  max(T, Acc, Max).
```

Find the total sum of all integers in a list
* sumList(L,S)
```
sumList([], 0).

sumList([H|T], S):-
  S is Snew + H,
  sumList(T,Snew). 
```

Define Fibonacci/2
* fib(X,Y) where Y is the Xth fibonacci number
```
fib(0, 0). 
fib(1, 1). 

fib(X, Y) :-
  X > 1,
  X2 is X – 2, fib(X2, Y2), 
  X1 is X – 1, fib(X1, Y1), 
  Y is Y1 + Y2.
```

Remove the first and last elements of a list
*toptail(L1,L2)
```
toptail(L1,L2):- append([_|L2], [_], L1). 
```

Split a list into two new lists
*split(L,N,L1,L2) where the list is split at the Nth index
```
split(L,0,[],L).

split([X|T1], N, [X|T2], L2):-
  N > 0,
  Nnew is N - 1,
  split(T1, Nnew, T2, L2).
```

Swap the first two elements of a list
```
swap12([],[]).

swap12([X,Y|List]), [Y,X|List]).
```



Duplicate the elements of a list agiven number of times
* dupli(L1,N,L2) L2 is obtained from L1 by duplicating all elements

```
dupli(L1,N,L2) :- dupli(L1,N,L2,N).

dupli([],_,[],_).

dupli([_|T1],N,T2,0) :- 
  dupli(T1,N,T2,N).
  
dupli([X|T1],N,[X|T2],K) :- 
  K > 0,
  K1 is K - 1, 
  dupli([X|T1],N,T2,K1).
```

Eliminate consecutive duplicates of list elements

```
compress([],[]).
compress([X],[X]).

compress([X,X|Xs],Zs) :- 
  compress([X|Xs],Zs).
  
compress([X,Y|Ys],[X|Zs]) :- 
  X \= Y, 
  compress([Y|Ys],Zs).
```

Find Kth Element of a list
* index(List,Element,Index)

```
index([E|_], E , 0).

index([_|T], E, I):-
  I is Index1 + 1,
  index(T, E, Index1).
```

Remove Kth element from a list
* remove(Element, List1, K, List2) List2 is List1 with Element at index K removed
```
remove(X,[X|T],1,T).

remove(X, [Y|T1], K , [Y|T2]):-
  K > 1,
  Knew is K - 1,
  remove(X, T1, K1, T2).
```

Drop every Nth element from a list
```
drop(L1,N,L2) :- drop(L1,N,L2,N).

drop([],_,[],_).

drop([_|Xs],N,Ys,1) :- 
  drop(Xs,N,Ys,N).
  
drop([X|Xs],N,[X|Ys],K) :- 
  K > 1, 
  K1 is K - 1, 
  drop(Xs,N,Ys,K1).
```


---
Sources include:

[99 Prolog problems](http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/)

[Learn Prolog Now](http://learnprolognow.org/)

[Hogwarts coursework]

[Grammar coursework]

[Tutorial 1]

[Tutorial 2]

[Tutorial 3]

[Tutorial 4]
