:- ensure_loaded(anime_facts).

% anime/9.
% anime(Name,Type,Status,Source,Rating,Season,Year,Genres,Themes).
% Title        : String
% Type         : String
% Status       : String
% Source       : String
% Rating       : String
% Season       : String             % Airing season
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