% Timofte Călin, Plătică Alexandru-Gabriel

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