; if we use * instead of square. it will call expmod twice before multiplying it.
; This is a recursive call. Therefore it will double the work.
; So, the complexity became log(2^n)
; log(2^n) can be rewritten as n log (2) which is basically n.
; Therfore, the complexity become big O of n.
