% anime/9.
% anime(Name,Type,Status,Source,Rating,Season,Year,Genres,Themes).
% Title        : String
% Type         : Atom
% Status       : Atom
% Source       : Atom
% Rating       : Atom
% Season       : Atom             % Airing season
% Year         : Integer            % Airing year
% Genres       : List of Strings
% Themes       : List of Strings

has_genres(Genres,Name) :-
    is_list(Genres),
    anime(Name,_,_,_,_,_,_,Genres1,_),
    subset(Genres,Genres1).

has_themes(Themes,Name) :-
    is_list(Themes),
    anime(Name,_,_,_,_,_,_,_,Themes1),
    subset(Themes,Themes1).

list_genres() :-
    findall(Genres,anime(_,_,_,_,_,_,_,Genres,_),GenresListUnsorted),
    filter_duplicates(GenresListUnsorted,GenresList),
    write(GenresList).

list_themes() :-
    findall(Themes,anime(_,_,_,_,_,_,_,_,Themes),ThemesListUnsorted),
    filter_duplicates(ThemesListUnsorted,ThemesList),
    write(ThemesList).
    
filter_duplicates([X],X) :- !.
filter_duplicates([X|Xs],GenresList) :-
    filter_duplicates(Xs,GenresList1),
    append(X,GenresList1,GenresList2),
    flatten(GenresList2,GenresList3),
    list_to_set(GenresList3, GenresList).
    