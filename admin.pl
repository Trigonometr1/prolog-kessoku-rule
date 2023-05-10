admin(admin, taufanyahya590728).

%Admin menu rule
adminmenu:-
    nl,
    write('Select from the following: "Select 1, 2, or 3"'),nl,
    write('1- Add an anime'),nl,
    write('2- Delete an anime'),nl,
    write('3- Exit'),nl,
    write('Enter your choice:'),nl,
    read(X),
    editselection(X).

%Edit selection rule
editselection(1):-
    nl,
    write('Enter the anime information. Please enter in described format and use . after every query'),nl, 
    write('Anime title (Write it in double quote): '),
    read(Animename),nl, 
    write('Anime type (Use _ for word separator, no need for single/double quote, lowercase): '),
    read(Animetype),nl, 
    write('Anime status (Use _ for word separator, no need for single/double quote, lowercase): '),
    read(Animestatus),nl, 
    write('Anime source (Use _ for word separator, no need for single/double quote, lowercase): '),
    read(Animesource),nl, 
    write('Anime rating (Use _ for word separator, use single quote, lowercase): '),
    read(Animerating),nl,
    write('Anime season (no need for single/double quote, lowercase): '),
    read(Animeseason),nl,
    write('Anime release year (integer, no need for single/double quote): '),
    read(Animeyear),nl,
    write('Anime genres (list of strings, example ["Action", "Drama"]): '),
    read(Animegenres),nl,
    write('Anime themes (list of strings, example ["Psychological", "Time Travel"]): '),
    read(Animethemes),nl,
    assert(anime(Animename, Animetype, Animestatus, Animesource, Animerating, Animeseason, Animeyear, Animegenres, Animethemes)),nl,
    adminmenu.

editselection(2):- 
    nl,
    write('Enter the anime name you want to delete. Please embed your input with double quote'),nl,
    read(Animename),
    correct_name(Animename, CorrectAnimename),
    writef('Deleting %w', [CorrectAnimename]),
    retract(anime(CorrectAnimename, _, _, _, _, _, _, _, _)),nl,
    adminmenu.

editselection(3):-
    nl,
    write('Thank you. Exiting Admin authority...'),nl,nl.