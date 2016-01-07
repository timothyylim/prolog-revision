#Sample Questions

These are sample questions collected from a variety of places and compiled into one file. You can find the sources at the bottom.



---

Define member/2

```
member(X,[X|_]).
member(X, [_|T]):-
  member(X,T).
```

Define append/3

```
append(_, L, L).
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
  N is Nnew + 1,
  len(T, N).
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
mysort(L1,L2):- setof(E, member(E,L), SL).
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
