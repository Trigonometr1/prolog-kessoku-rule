% make me a prolog program that tells me welcome and then ask me if I am an admin or a user with a number
% If i am an admin run start_admin else run start_user
:- use_module(library(readutil)).
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

process_user_command('help') :-
    write('List of commands:'), nl,
    write('1. help -- menampilkan semua perintah yang tersedia'), nl,
    write('2. exit -- keluar dari program'), nl,
    write('3. add -- menambahkan anime ke history'), nl,
    write('4. recommend -- rekomendasikan anime berdasarkan history'), nl,
    start(1).

process_user_command('add') :-
    write('Enter your favorite anime titles separated by commas: '),
    read_line_to_string(user_input, Line),
    split_string(Line, ",", " ", Titles),
    save_history(Titles),
    write('Your history has been saved.'), nl,
    start(1).

process_user_command('recommend') :-
    recommend_me(), nl,
    start(1).

process_user_command(_) :-
    write('Invalid command. Type \'help.\' to see the list of commands.'), nl,
    start(1).