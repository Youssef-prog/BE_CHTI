	AREA Signal, DATA, READONLY
	export TabSig

; Fnor1 = 23.000
;   Ph1 = -26.565
;    A1 = 62.000		env. 50mV/3300mV
; Fnor2 = 24.000
;   Ph2 = -116.565
;    A2 = 1024.000

; valeurs attendues pour k = 23 :
;	Re	0x0378FDBD
;	Im	0x01BAD0C5	env 0.5 * Re, car tan(26.565) ~= 0.5
;	M2	0x000F0D16	986390 
;
; valeurs attendues pour k = 24 :
;	Re	0xE36136DD	env -0.447 * 2^30
;	Im	0x393E61CA	env -2 * Re, car tan(116.565) ~= 2.0
;	M2	0x0FFFF53C	env 2^28
;
; pour les autres valeurs de k sauf les alias de 23 et 24 :
;	M2    < 0x0000000F

TabSig
	DCW	1646	;  0 0x066e  0.40186
	DCW	3006	;  1 0x0bbe  0.73389
	DCW	1094	;  2 0x0446  0.26709
	DCW	2434	;  3 0x0982  0.59424
	DCW	2465	;  4 0x09a1  0.60181
	DCW	1066	;  5 0x042a  0.26025
	DCW	3018	;  6 0x0bca  0.73682
	DCW	1666	;  7 0x0682  0.40674
	DCW	1610	;  8 0x064a  0.39307
	DCW	3052	;  9 0x0bec  0.74512
	DCW	1071	; 10 0x042f  0.26147
	DCW	2417	; 11 0x0971  0.59009
	DCW	2510	; 12 0x09ce  0.61279
	DCW	1026	; 13 0x0402  0.25049
	DCW	3024	; 14 0x0bd0  0.73828
	DCW	1699	; 15 0x06a3  0.41479
	DCW	1562	; 16 0x061a  0.38135
	DCW	3080	; 17 0x0c08  0.75195
	DCW	1083	; 18 0x043b  0.26440
	DCW	2374	; 19 0x0946  0.57959
	DCW	2553	; 20 0x09f9  0.62329
	DCW	1015	; 21 0x03f7  0.24780
	DCW	2995	; 22 0x0bb3  0.73120
	DCW	1746	; 23 0x06d2  0.42627
	DCW	1531	; 24 0x05fb  0.37378
	DCW	3072	; 25 0x0c00  0.75000
	DCW	1124	; 26 0x0464  0.27441
	DCW	2329	; 27 0x0919  0.56860
	DCW	2568	; 28 0x0a08  0.62695
	DCW	1041	; 29 0x0411  0.25415
	DCW	2948	; 30 0x0b84  0.71973
	DCW	1781	; 31 0x06f5  0.43481
	DCW	1535	; 32 0x05ff  0.37476
	DCW	3033	; 33 0x0bd9  0.74048
	DCW	1170	; 34 0x0492  0.28564
	DCW	2310	; 35 0x0906  0.56396
	DCW	2547	; 36 0x09f3  0.62183
	DCW	1087	; 37 0x043f  0.26538
	DCW	2910	; 38 0x0b5e  0.71045
	DCW	1782	; 39 0x06f6  0.43506
	DCW	1570	; 40 0x0622  0.38330
	DCW	2986	; 41 0x0baa  0.72900
	DCW	1194	; 42 0x04aa  0.29150
	DCW	2327	; 43 0x0917  0.56812
	DCW	2502	; 44 0x09c6  0.61084
	DCW	1127	; 45 0x0467  0.27515
	DCW	2904	; 46 0x0b58  0.70898
	DCW	1749	; 47 0x06d5  0.42700
	DCW	1618	; 48 0x0652  0.39502
	DCW	2959	; 49 0x0b8f  0.72241
	DCW	1181	; 50 0x049d  0.28833
	DCW	2370	; 51 0x0942  0.57861
	DCW	2459	; 52 0x099b  0.60034
	DCW	1138	; 53 0x0472  0.27783
	DCW	2933	; 54 0x0b75  0.71606
	DCW	1702	; 55 0x06a6  0.41553
	DCW	1649	; 56 0x0671  0.40259
	DCW	2967	; 57 0x0b97  0.72437
	DCW	1140	; 58 0x0474  0.27832
	DCW	2414	; 59 0x096e  0.58936
	DCW	2444	; 60 0x098c  0.59668
	DCW	1112	; 61 0x0458  0.27148
	DCW	2980	; 62 0x0ba4  0.72754
	DCW	1668	; 63 0x0684  0.40723

	END
