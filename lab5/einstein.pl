% Platica Alexandu-Gabriel, Timofte Calin

exists(A, houselist(A, _, _, _, _)).
exists(A, houselist(_, A, _, _, _)).
exists(A, houselist(_, _, A, _, _)).
exists(A, houselist(_, _, _, A, _)).
exists(A, houselist(_, _, _, _, A)).

rightOf(R, L, houselist(L, R, _, _, _)).
rightOf(R, L, houselist(_, L, R, _, _)).
rightOf(R, L, houselist(_, _, L, R, _)).
rightOf(R, L, houselist(_, _, _, L, R)).

first(A, houselist(A, _, _, _, _)).
middle(A, houselist(_, _, A, _, _)).

nextTo(A, B, houselist(B, A, _, _, _)).
nextTo(A, B, houselist(_, B, A, _, _)).
nextTo(A, B, houselist(_, _, B, A, _)).
nextTo(A, B, houselist(_, _, _, B, A)).
nextTo(A, B, houselist(A, B, _, _, _)).
nextTo(A, B, houselist(_, A, B, _, _)).
nextTo(A, B, houselist(_, _, A, B, _)).
nextTo(A, B, houselist(_, _, _, A, B)).

riddle(Houses) :-
  exists(house(red, brit, _, _, _), Houses),
  exists(house(_, swede, _, _, dogs), Houses),
  exists(house(_, dane, tea, _, _), Houses),
  rightOf(house(white, _, _, _, _), house(green, _, _, _, _), Houses),
  exists(house(green, _, coffee, _, _), Houses),
  exists(house(_, _, _, pallmall, birds), Houses),
  exists(house(yellow, _, _, dunhill, _), Houses),
  middle(house(_, _, milk, _, _), Houses),
  first(house(_, norwegian, _, _, _), Houses),
  nextTo(house(_, _, _, blend, _), house(_, _, _, _, cats), Houses),
  nextTo(house(_, _, _, dunhill, _),house(_, _, _, _, horses), Houses),
  exists(house(_, _, beer, bluemaster, _), Houses),
  exists(house(_, german, _, prince, _), Houses),
  nextTo(house(_, norwegian, _, _, _), house(blue, _, _, _, _), Houses),
  nextTo(house(_, _, _, blend, _), house(_, _, water, _, _), Houses),
  exists(house(_, _, _, _, fish), Houses).

solution(Animal) :-
  riddle(Houses),
  rightOf(house(_,_,_,_,Animal),house(red,_,_,_,_), Houses).


% The situation

%     There are 5 houses in five different colors.
%     In each house lives a person with a different nationality.
%     These five owners drink a certain type of beverage, smoke a certain brand of cigar and keep a certain pet.
%     No owners have the same pet, smoke the same brand of cigar or drink the same beverage. 

% The question is: Who owns the fish?
% Hints

%     -the Brit lives in the red house
%     -the Swede keeps dogs as pets
%     -the Dane drinks tea
%     -the green house is on the left of the white house
%     -the green houses owner drinks coffee
%     -the person who smokes Pall Mall rears birds
%     -the owner of the yellow house smokes Dunhill
%     -the man living in the center house drinks milk
%     -the Norwegian lives in the first house
%     -the man who smokes blends lives next to the one who keeps cats
%     -the man who keeps horses lives next to the man who smokes Dunhill
%     -the owner who smokes BlueMaster drinks beer
%     -the German smokes Prince
%     -the Norwegian lives next to the blue house
%     -the man who smokes blend has a neighbor who drinks water 

% Einstein wrote this riddle this century. He said that 98% of the world could not solve it. 
