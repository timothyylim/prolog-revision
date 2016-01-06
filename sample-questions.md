#Sample Questions

These are sample questions collected from a variety of places and compiled into one file. You can find the sources at the bottom.

The idea is that if you can do all the questions here you should be good to go for the exam. 


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



---
Sources include:

[99 Prolog problems](http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/)

[Learn Prolog Now)(http://learnprolognow.org/)

[Hogwarts coursework]

[Grammar coursework]

[Tutorial 1]

[Tutorial 2]

[Tutorial 3]

[Tutorial 4]
