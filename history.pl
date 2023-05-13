save_history(Names) :-
    member(Name, Names),
    findall(temp(Name,Rating,Genres,Themes), anime(Name,_,_,_,Rating,_,_,Genres,Themes), [Y|_]),
    asserta(Y), fail.

% save_history(["Naruto", "One Piece", "Dragon Ball", "Bleach"]).
% listing(temp).
get_data(Names,Ratings,Genreses,Themeses, All) :- 
    All1 = [],
    findall(Name,temp(Name,_,_,_),Names), 
    findall(Rating, temp(_,Rating,_,_), Ratings1), extract_data(Ratings1, "Rating", [(Ratings, _, _)|Ratings2]), 
    append(All1, Ratings2, All2),
    findall(Genres, temp(_,_,Genres,_), Genreses1), flatten(Genreses1, Genreses2), extract_data(Genreses2, "Genre", [(Genreses, _, _)|Genreses3]),
    append(All2, Genreses3, All3),
    findall(Themes, temp(_,_,_,Themes), Themeses1), flatten(Themeses1, Themeses2), extract_data(Themeses2, "Theme", [(Themeses, _, _)|Themeses3]),
    append(All3, Themeses3, All4), predsort(descending_triple, All4, All).

recommending() :-
    get_data(Names,Ratings,Genreses,Themeses, All),
    recommending_start(Names,Ratings,Genreses,Themeses, All).

find(Rating,Genreses,Themeses, Rec_Anime3) :-
    findall((Name, Genres, Themes),anime(Name,_,_,_,Rating,_,_,Genres,Themes), Rec_Anime),
    filter_genre(Rec_Anime, Genreses, Rec_Anime1), filter_theme(Rec_Anime1, Themeses, Rec_Anime2), 
    get_name(Rec_Anime2, Rec_Anime3).
% findall(temp(Name, Genres, Themes),anime(Name,tv, finished_airing, manga, pg_13,fall, 2004,"Fantasy","Martial Arts"), Rec_Anime),
% find(["Bleach", "Dragon Ball", "One Piece", "Naruto"], tv, finished_airing, manga, pg_13,fall, 2004,"Fantasy","Martial Arts", X)

get_name([], []).
get_name([(Name, _, _)| Xs], [Name|Ys]) :- get_name(Xs, Ys). 

filter_genre([], _, []).
filter_genre([(Name, Genres, Themes)|Lst], Genre, Res) :- 
    member(Genre, Genres), filter_genre(Lst, Genre, Res1), append(Res1, [(Name, Genres, Themes)], Res), !.
filter_genre([_|Lst], Genre, Res) :- 
    filter_genre(Lst, Genre, Res).

filter_theme([], _, []).
filter_theme([(Name, Genres, Themes)|Lst], Theme, Res) :- 
    member(Theme, Themes), filter_theme(Lst, Theme, Res1), append(Res1, [(Name, Genres, Themes)], Res), !.
filter_theme([_|Lst], Theme, Res) :- 
    filter_theme(Lst, Theme, Res).


recommending_start(Names, Rating, Genres, Themes, All) :-
    write("Mungkin anda suka ini"), nl, 
    find(Rating,Genres,Themes,Rec_Names1),
    subtract(Rec_Names1, Names, Rec_Names),
    write(Rec_Names), nl, 
    write("Ingin melanjutkan? (y/n)"), nl(), read(In), 
    In == "y", 
    append(Names, Rec_Names, Names2),
    recommending_next(Names2, Rating, Genres, Themes, All).

recommending_next(Names, _, Genres, Themes, [(Val, _, "Rating")|All]) :-
    recommending_next2(Names, Val, Genres, Themes, All), !.
recommending_next(Names, Rating, _, Themes, [(Val, _, "Genre")|All]) :-
    recommending_next2(Names, Rating, Val, Themes, All), !.
recommending_next(Names, Rating, Genres, _, [(Val, _, "Theme")|All]) :-
    recommending_next2(Names, Rating, Genres, Val, All), !.

recommending_next2(Names, Rating, Genres, Themes, All) :-
    write("Bagaimana dengan ini?"), nl, 
    find(Rating,Genres,Themes,Rec_Names1),
    subtract(Rec_Names1, Names, Rec_Names),
    write(Rec_Names), nl, 
    write("Ingin melanjutkan? (y/n)"), nl(), read(In), 
    In == "y", 
    append(Names, Rec_Names, Names2),
    recommending_next(Names2, Rating, Genres, Themes, All).

extract_data(A, B, C) :- 
    list_to_set(A, D),
    create_pair(D, A, [], E),
    tuple_to_triple(E, B, F),
    predsort(descending_triple, F, C).


tuple_to_triple([], _, []).
tuple_to_triple([(A, B)| X] , C, D) :- tuple_to_triple(X, C, D1), append([(A, B, C)], D1, D).

descending_triple(>, (A, B, _), (C, D, _)) :-
    (   B @< D
    ;   B == D,
        A @< C ).
descending_triple(=, (A, B, _), (C, D, _)) :-
    A == C,
    B == D.
descending_triple(<, (A, B, _), (C, D, _)) :-
    (   B @> D
    ;   B == D,
        A @> C ).
        
create_pair(A, B) :-
    list_to_set(A, C),
    create_pair(C, A, [], B).

create_pair([], _, C, C) :- !.

create_pair([A|As], B, C1, D):-
    count_in_list(A, B, 0, E),
    append(C1, [(A, E)], C),
    create_pair(As, B, C, D).

count_in_list(_, [], Count, Count).
count_in_list(X, [X|Xs], Count, Res) :-
    C1 is Count + 1, count_in_list(X, Xs, C1, Res), !.
count_in_list(X, [_|Xs], Count, Res) :- count_in_list(X, Xs, Count, Res).
