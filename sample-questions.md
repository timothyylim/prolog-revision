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
