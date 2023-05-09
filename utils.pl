% https://www.swi-prolog.org/pldoc/man?section=isub
:- use_module(library(isub)).

correct_genre(Word, CorrectWord) :-
    !,
    genre(CorrectWord),
    isub(Word, CorrectWord, Similarity, [zero_to_one(true), normalize(true)]),
    Similarity > 0.75.

correct_theme(Word, CorrectWord) :-
    !,
    theme(CorrectWord),
    isub(Word, CorrectWord, Similarity, [zero_to_one(true), normalize(true)]),
    Similarity > 0.75.