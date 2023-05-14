admin(admin, taufanyahya590728).

authenticate:-
    nl,
    write('Username: '),nl,read(U),
    write('Password: '),nl, read(P)
    verified(U,P),
    adminmenu.

verified(U,P):-
    admin(U,P),nl,
    write('Selamat datang, admin!'),nl.

verified(U,P):-
    \+ admin(U,P),nl,
    write('Username atau password salah!'),nl,
    authenticate.

%Admin menu rule
adminmenu:-
    nl,
    write('Silakan pilih opsi 1, 2, atau 3'),nl,
    write('1- Menambahkan anime'),nl,
    write('2- Menghapus anime'),nl,
    write('3- Keluar'),nl,
    write('Masukkan opsi:'),nl,
    read(X),
    editselection(X).

%Edit selection rule
editselection(1):-
    nl,
    write('Masukkan informasi anime menggunakan format dan gunakan . setelah setiap kueri.'),nl, 
    write('Anime title (Gunakan double quote): '),
    read(Animename),nl, 
    write('Anime type (Gunakan _ untuk pemisah kata, tidak perlu single/double quote, huruf kecil): '),
    read(Animetype),nl, 
    write('Anime status (Gunakan _ untuk pemisah kata, tidak perlu single/double quote, huruf kecil): '),
    read(Animestatus),nl, 
    write('Anime source (Gunakan _ untuk pemisah kata, tidak perlu single/double quote, huruf kecil): '),
    read(Animesource),nl, 
    write('Anime rating (Gunakan _ untuk pemisah kata, gunakan single quote, huruf kecil): '),
    read(Animerating),nl,
    write('Anime season (tidak butuh single/double quote, huruf kecil): '),
    read(Animeseason),nl,
    write('Anime release year (bilangan bulat, tidak butuh single/double quote): '),
    read(Animeyear),nl,
    write('Anime genres (list of strings, contoh ["Action", "Drama"]): '),
    read(Animegenres),nl,
    write('Anime themes (list of strings, contoh ["Psychological", "Time Travel"]): '),
    read(Animethemes),nl,
    assert(anime(Animename, Animetype, Animestatus, Animesource, Animerating, Animeseason, Animeyear, Animegenres, Animethemes)),nl,
    adminmenu.

editselection(2):- 
    nl,
    write('Silakan tuliskan nama anime yang akan dihapus. Gunakan double quote'),nl,
    read(Animename),
    correct_name(Animename, CorrectAnimename),
    writef('Menghapus %w ...', [CorrectAnimename]),
    retract(anime(CorrectAnimename, _, _, _, _, _, _, _, _)),nl,
    adminmenu.

editselection(3):-
    nl,
    write('Terima kasih. Meninggalkan menu Admin...'),nl,
    start.