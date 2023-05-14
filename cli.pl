start :-
    write('Selamat datang di sistem rekomendasi anime'), nl,
    write('Apakah anda User atau Admin?'), nl,
    write('1. User'), nl,
    write('2. Admin'), nl,
    write('Choose a number: (ex/ 1.) '),
    read(X),
    start(X).

start(1) :-
    % Display a prompt and read user input
    write('Masukkan sebuah perintah: '),
    read(UserCommand),
    process_user_command(UserCommand).

start(2) :-
    write('Semua predicate dapat dicek melalui admin.pl'), nl.

process_user_command('exit') :- !.
process_user_command('quit') :- !.
process_user_command('bye') :- !.

process_user_command('help') :-
    write('List of commands:'), nl,
    write('1. help -- menampilkan semua perintah yang tersedia'), nl,
    write('2. exit -- keluar dari program'), nl,
    write('3. add -- menambahkan anime ke history'), nl,
    write('4. recommend -- rekomendasikan anime berdasarkan history'), nl,
    write('5. history -- menampilkan seluruh history'), nl,
    write('6. delete -- menghapus history spesifik'), nl,
    write('7. clear -- menghapus seluruh history'), nl,
    start(1).

process_user_command('add') :-
    write('Enter your favorite anime titles list'), nl,
    write('Example: ["Naruto", "One Piece", "Bleach"].'), nl,
    read(Titles),
    \+ save_history(Titles),
    write('Your history has been saved.'), nl,
    start(1).

process_user_command('delete') :-
    write('Enter your anime to delete from history'), nl,
    write('Example: ["Naruto", "One Piece", "Bleach"].'), nl,
    read(Titles),
    \+ delete_history(Titles),
    write('Your history has been saved.'), nl,
    start(1).

process_user_command('clear') :-
    clear_history(),
    write('Your history has been cleared.'), nl,
    start(1).

process_user_command('recommend') :-
    recommend_me(), nl,
    start(1).

process_user_command('history') :-
    write('Your history:'), nl,
    \+ list_history(), nl,
    start(1).

process_user_command(_) :-
    write('Invalid command. Type \'help.\' to see the list of commands.'), nl,
    start(1).