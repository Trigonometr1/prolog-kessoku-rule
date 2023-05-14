start :-
    write('Selamat datang di SiAnime, sistem rekomendasi anime'), nl,
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
    % Display a prompt and read user input
    write('Silakan lakukan autentikasi diri dahulu'), nl,
    authenticate.

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
    write('Ketikkan list nama anime yang mau ditambahkan ke riwayat'), nl,
    write('Contoh: ["Naruto", "One Piece", "Bleach"].'), nl,
    read(Titles),
    \+ save_history(Titles),
    write('Riwayat Anda sudah disimpan.'), nl,
    start(1).

process_user_command('delete') :-
    write('Ketikkan list nama anime yang mau dihilangkan dari riwayat'), nl,
    write('Contoh: ["Naruto", "One Piece", "Bleach"].'), nl,
    read(Titles),
    \+ delete_history(Titles),
    write('Riwayat Anda sudah disimpan.'), nl,
    start(1).

process_user_command('clear') :-
    clear_history(),
    write('Riwayat Anda sudah dibersihkan.'), nl,
    start(1).

process_user_command('recommend') :-
    recommend_me(), nl,
    start(1).

process_user_command('history') :-
    write('Riwayat Anda:'), nl,
    \+ list_history(), nl,
    start(1).

process_user_command(_) :-
    write('Perintah salah. Gunakan \'help.\' untuk melihat perintah yang bisa digunakan.'), nl,
    start(1).