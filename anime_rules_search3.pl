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

has_genres(Genres,Name) :-
    is_list(Genres),
    anime(Name,_,_,_,_,_,_,Genres1,_),
    subset(Genres,Genres1).

has_themes(Themes,Name) :-
    is_list(Themes),
    anime(Name,_,_,_,_,_,_,_,Themes1),
    subset(Themes,Themes1).