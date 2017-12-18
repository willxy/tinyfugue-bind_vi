/set vimode=
/set status_fields @more:8:Br :1 @world :1 @read:6 :1 @active:11 :1 @log:5 :1 @mail:6 :1 vimode:9 :1 insert:6 :1 @clock:5

/def -i visetmode = /set vimode=%1%; /test status_fields := status_fields
/def -i viins = \
	/purge -ib vi_*%; \
	/def -i -b'^U' = /DOKEY DLINE%; \
	/def -ib'^[' vi_esc = /vicmd%; \
	/visetmode
/def -i vicmd = /vi_left%; \
	/load -q ~/.tf-vicmd%; \
	/visetmode VI-CMD

/def -i visave = /set _viundo=$(/recall -i 1)
/def -i viundo = /if ( _viundo !~ "" ) \
		/dokey dline%; \
		/eval /input %{_viundo}%; \
		/dokey LEFT%; \
	/else \
		/echo % vi: Empty undo buffer.%; \
		/beep%; \
	/endif

/visave

/def -i vi_right = /if ( $(/recall -i 1) !~ "") \
		/dokey RIGHT%; \
	/endif%; \

/def -i vi_left = /if ( $(/recall -i 1) !~ "") \
		/dokey LEFT%; \
	/endif%; \

/def -ib'~' vi_help = /list -i vi*
/def -ib'^[' vi_esc =
/def -ib'^U' vi_clear = /dokey DLINE%; /viins

/def -ib'a' vi_a = /vi_right%; /viins
/def -ib'b' vi_b = /dokey WLEFT
;/def -ib'c' vi_c = /beep
;/def -ib'd' vi_d = /beep
/def -ib'e' vi_e = /dokey WRIGHT
/def -ib'f' vi_f = /beep
/def -ib'g' vi_g = /beep
/def -ib'h' vi_h = /dokey LEFT
/def -ib'i' vi_i = /viins
/def -ib'j' vi_j = /dokey RECALLF%; /vi_left
/def -ib'k' vi_k = /dokey RECALLB%; /vi_left
/def -ib'l' vi_l = /dokey RIGHT
/def -ib'm' vi_m = /beep
/def -ib'n' vi_n = /dokey SEARCHB
/def -ib'o' vi_o = /beep
/def -ib'p' vi_p = /eval /input %{_vibuffer}
/def -ib'q' vi_q = /beep
/def -ib'r' vi_r = /dokey DCH%; /viins
/def -ib's' vi_s = /dokey DCH%; /viins
/def -ib't' vi_t = /beep
/def -ib'u' vi_u = /viundo
/def -ib'v' vi_v = /beep
/def -ib'w' vi_w = /dokey WRIGHT
/def -ib'x' vi_x = /dokey DCH
;/def -ib'y' vi_y = /beep
/def -ib'z' vi_z = /beep

/def -ib'A' vi_cap-A = /dokey END%; /viins
/def -ib'B' vi_cap-B = /dokey WLEFT
/def -ib'C' vi_cap-C = /beep
/def -ib'D' vi_cap-D = /dokey DEOL
/def -ib'E' vi_cap-E = /dokey WRIGHT
/def -ib'F' vi_cap-F = /beep
/def -ib'G' vi_cap-G = /dokey RECALLEND%; /vi_left
/def -ib'H' vi_cap-H = /dokey HOME
/def -ib'I' vi_cap-I = /dokey HOME%; /viins
/def -ib'J' vi_cap-J = /dokey DOWN
/def -ib'K' vi_cap-K = /dokey UP
/def -ib'L' vi_cap-L = /dokey END
/def -ib'M' vi_cap-M = /beep
/def -ib'N' vi_cap-N = /beep
/def -ib'O' vi_cap-O = /beep
/def -ib'P' vi_cap-P = /beep
/def -ib'Q' vi_cap-Q = /beep
/def -ib'R' vi_cap-R = /beep
/def -ib'S' vi_cap-S = /beep
/def -ib'T' vi_cap-T = /beep
/def -ib'U' vi_cap-U = /beep
/def -ib'V' vi_cap-V = /beep
/def -ib'W' vi_cap-W = /dokey WRIGHT
/def -ib'X' vi_cap-X = /beep
/def -ib'Y' vi_cap-Y = /beep
/def -ib'Z' vi_cap-Z = /beep

/def -ib'0' vi_0 = /dokey HOME
;/def -ib'1' vi_1 = /beep
/def -ib'2' vi_2 = /beep
/def -ib'3' vi_3 = /beep
/def -ib'4' vi_4 = /beep
/def -ib'5' vi_5 = /beep
/def -ib'6' vi_6 = /beep
/def -ib'7' vi_7 = /beep
/def -ib'8' vi_8 = /beep
/def -ib'9' vi_9 = /beep

/def -ib'`' vi_backtick = /beep
;/def -ib'~' vi_tilde = /beep
/def -ib'!' vi_bang = /beep
/def -ib'@' vi_atsign = /beep
/def -ib'#' vi_hash = /beep
/def -ib'$' vi_dollar = /dokey END
/def -ib'%' vi_percent = /beep
/def -ib'^' vi_caret = /beep
/def -ib'&' vi_ampersand = /beep
/def -ib'*' vi_asterisk = /beep
/def -ib'(' vi_oparen = /beep
/def -ib')' vi_cparen = /beep
/def -ib'-' vi_dash = /dokey RECALLB%; /vi_left
/def -ib'=' vi_equal = /beep
/def -ib'_' vi_underline = /beep
/def -ib'+' vi_plus = /dokey RECALLF%; /vi_left
/def -ib'[' vi_obracket = /beep
/def -ib']' vi_cbracket = /beep
/def -ib'\134' vi_backslash = /beep
/def -ib'{' vi_ocurly = /beep
/def -ib'}' vi_ccurly = /beep
/def -ib'|' vi_pipe = /beep
/def -ib';' vi_semicolon = /beep
/def -ib'\047' vi_tick = /beep
/def -ib':' vi_colon = /beep
/def -ib'"' vi_quote = /beep
/def -ib',' vi_comma = /beep
/def -ib'.' vi_period = /beep
/def -ib'/' vi_slash = /dokey SEARCHB
/def -ib'<' vi_lessthan = /beep
/def -ib'>' vi_greater = /beep
/def -ib'?' vi_question = /dokey SEARCHF
/def -ib'\040' vi_space = /dokey RIGHT
;/def -ib'\012' vi_newline = /dokey NEWLINE%; /viins
/def -ib'\015' vi_return = /dokey NEWLINE%; /viins

/def -ib'1G' vi_1capG = /dokey RECALLBEG%; /vi_left
/def -ib'dd' vi_dd = /set _vibuffer=$(/recall -i 1)%; /dokey dline
/def -ib'dw' vi_dw = /dokey DWORD
/def -ib'dW' vi_dcapW = /dokey DWORD
/def -ib'cw' vi_cw = /dokey DWORD%; /viins
/def -ib'yy' vi_yy = /set _vibuffer=$(/recall -i 1)
