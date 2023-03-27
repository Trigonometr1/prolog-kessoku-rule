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

search_by_type(Type,Name) :-
    anime(Name,Type,_,_,_,_,_,_,_).

search_by_status(Status,Name) :-
    anime(Name,_,Status,_,_,_,_,_,_).

search_by_source(Source,Name) :-
    anime(Name,_,_,Source,_,_,_,_,_).

search_by_rating(Rating,Name) :-
    anime(Name,_,_,_,Rating,_,_,_,_).

list_rating(RatingList) :-
    findall(Rating,anime(_,_,_,_,Rating,_,_,_,_),RatingListUnsorted),
    sort(0, @<, RatingListUnsorted,RatingList).

list_source(SourceList) :-
    findall(Source,anime(_,_,_,Source,_,_,_,_,_),SourceListUnsorted),
    sort(0, @<, SourceListUnsorted,SourceList).

list_status(StatusList) :-
    findall(Status,anime(_,_,Status,_,_,_,_,_,_),StatusListUnsorted),
    sort(0, @<, StatusListUnsorted,StatusList).

list_type(TypeList) :-
    findall(Type,anime(_,Type,_,_,_,_,_,_,_),TypeListUnsorted),
    sort(0, @<, TypeListUnsorted,TypeList).