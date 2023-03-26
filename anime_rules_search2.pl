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

cast_season(winter,0).
cast_season(spring,1).
cast_season(summer,2).
cast_season(fall,3).

cast_year_season(Season,Year,Result) :-
    cast_season(Season,SeasonInt),
    Result is Year * 10 + SeasonInt.

airing_before(Season,Year,Name) :-
    anime(Name,_,_,_,_,SeasonA,YearA,_,_),
    cast_year_season(SeasonA,YearA,ResA),
    cast_year_season(Season,Year,Res),
    ResA < Res.

airing_after(Season,Year,Name) :-
    anime(Name,_,_,_,_,SeasonA,YearA,_,_),
    cast_year_season(SeasonA,YearA,ResA),
    cast_year_season(Season,Year,Res),
    ResA > Res.

airing_at(Season,Year,Name) :-
    anime(Name,_,_,_,_,SeasonA,YearA,_,_),
    cast_year_season(SeasonA,YearA,ResA),
    cast_year_season(Season,Year,Res),
    ResA =:= Res.