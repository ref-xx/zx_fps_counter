; 50 fps bouncer
; By Arda Erdikmen 02.01.2015

; Creative Commons Attribution-Sharealike Lisansý ile daðýtýlmýþtýr.
; https://creativecommons.org/licenses/by-sa/3.0/


org 36352
incbin "fpscounter.bin"

org 32768


di                    ;interrupt durdur

ld a,0
out (254),a           ;border siyah olsun

LD hl,16384           ;bitmap'ý sil
ld (hl),0
LD de,16385
ld bc, 6143
LDIR

LD hl,16384+6144      ;renkleri sil
ld (hl),56
LD de,16385+6144
ld bc, 768
LDIR



;IM2 ayarla

;sadece zamanlama için kullanmak isterseniz
;interrupt servis rutini bu þekilde kurabilirsiniz
;interrupt olduðunda ret ile hemen geri dönülür
;bu durumda HALT bittiði gibi program devam eder

di
ld hl,65021             ; bu adrese tek bir komut:
ld (hl),201             ; 201=ret
ld   hl,65024           ; ram'in bu kýsmýný dolduracaðýz
ld   de,65025           ; doldurduðumuz þey interrupt vektörünün diðer kýsmý
ld   (hl),253           ; IM2 tuhaf biþey, suyunun suyu þeklinde
ld   b,e                ; çalýþýyor
ld   c,e
ldir                    ; doldur!

ld   a,254              ; bu interrupt vektörü'nün diðer yarýsý,
ld   i,a                ; 254 Ula Snow oluþturmaz, tüm modellere uygundur
im   2                  ; interrupt mode 2

ld hl, 36352+256
LD (count),HL



ei
halt

mainloop
di

ld a,2
out (254),a           ;border siyah olsun

LD HL,(count)
ld de,22528
ld bc,256
ldir
LD HL,(count)
inc h
ld (count),hl

ld a,h
cp 0xC1
jp nz,cont

ld hl, 36352+256
LD (count),HL




cont
ld a,h

and %00001111
out (254),a

ld c,24

       ld b,16
       xor a
         add hl,hl
         rla
         cp c
         jr c,$+4
           inc l
           sub c
         djnz $-7


ld b,h
ld c,l
ld hl,0
ld de,0
ldir


ld a,l
and %00000001
rlc a

out (254),a


          ;border siyah olsun
ei
halt

jp mainloop

count  DEFW 0



end 32768
