% Timofte Călin, Plătică Alexandru-Gabriel

% S->AS'
% S'->BC
% S'->DE
% S->ECAB
% C->C1 C2
% E->E1 E2
% A->am
% B->citit
% C1->o 
% C2->carte
% D->mers
% E1->la
% E2->facultate

% VARIANTA 1
% s(In,Out):-a(In,In2), sprim(In2,Out).
% sprim(In,Out):-b(In,In2), c(In2,Out).
% sprim(In,Out):-d(In,In2), e(In2,Out).
% s(In,Out):-e(In,In2),c(In3,In4),a(In4,In5),b(In5,Out).
% c(In,Out):-c1(In,In2),c2(In2,Out).
% e(In,Out):-e1(In,In2),e2(In2,Out).

% a([am|W],W).
% b([citit|W],W).
% c1([o|W],W).
% c2([carte|W],W).
% d([mers|W],W).
% e1([la|W],W).
% e2([facultate|W],W).


% VARIANTA 2
% to do: counter cu numarul de aplicari de reguli
s(In,Out):-np(In,In2),np(In2,In3),vp(In3,Out).
s(In,Out):-vp(In,In2),np(In2,Out).
vp(In,Out):-det(In,In2),v(In2,Out).
np(In,Out):-det(In,In2),n(In2,Out).

det([o|W],W).
det([am|W],W).
det([la|W],W).

v([mers|W],W).
v([citit|W],W).

n([carte|W],W).
n([facultate|W],W).