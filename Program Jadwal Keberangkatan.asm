.model small
.data
    tujuan_penerbangan1 db 'Jakarta'
    waktu_keberangkatan1 db '08:00'
    nomor_penerbangan1 db 'GA123'
    tujuan_penerbangan2 db 'Surabaya'
    waktu_keberangkatan2 db '10:30'
    nomor_penerbangan2 db 'GA456'
    newline db 13, 10, '$'
    prompt1 db '1. Jakarta - GA123 (08:00)$'
    prompt2 db '2. Surabaya - GA456 (10:30)$'
    choose_prompt db 'Pilih nomor penerbangan (1/2): $'
    invalid_prompt db 'Pilihan tidak valid. Coba lagi.$'

.code
    main proc
        ; Set up data segment
        mov ax, @data
        mov ds, ax

        ; Menampilkan opsi jadwal penerbangan
        mov ah, 9
        lea dx, prompt1
        int 21h
        mov ah, 9
        lea dx, newline
        int 21h

        mov ah, 9
        lea dx, prompt2
        int 21h
        mov ah, 9
        lea dx, newline
        int 21h

        ; Meminta pengguna memilih nomor penerbangan
        get_input:
            mov ah, 9
            lea dx, choose_prompt
            int 21h
            mov ah, 1
            int 21h
            sub al, '0'  ; Konversi ASCII ke bilangan
            cmp al, 1
            je  display_flight1
            cmp al, 2
            je  display_flight2
            jmp invalid_choice

        display_flight1:
            ; Menampilkan detail jadwal penerbangan 1
            mov ah, 9
            lea dx, tujuan_penerbangan1
            int 21h
            mov ah, 9
            lea dx, newline
            int 21h
            mov ah, 9
            lea dx, waktu_keberangkatan1
            int 21h
            mov ah, 9
            lea dx, newline
            int 21h
            mov ah, 9
            lea dx, nomor_penerbangan1
            int 21h
            jmp exit_program

        display_flight2:
            ; Menampilkan detail jadwal penerbangan 2
            mov ah, 9
            lea dx, tujuan_penerbangan2
            int 21h
            mov ah, 9
            lea dx, newline
            int 21h
            mov ah, 9
            lea dx, waktu_keberangkatan2
            int 21h
            mov ah, 9
            lea dx, newline
            int 21h
            mov ah, 9
            lea dx, nomor_penerbangan2
            int 21h
            jmp exit_program

        invalid_choice:
            ; Menampilkan pesan kesalahan untuk pilihan tidak valid
            mov ah, 9
            lea dx, invalid_prompt
            int 21h
            jmp get_input

        ; Exit program
        exit_program:
            mov ah, 4ch
            int 21h
    main endp

end main
