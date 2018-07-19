
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | VAL of (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 11 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
  )
    | SEP
    | NL
    | EOF
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState11
  | MenhirState1

let rec _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75 * 'tv_rev_records) * _menhir_state) = Obj.magic _menhir_stack in
        ((* _menhir_error11 *)
        (let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * 'tv_rev_records) = Obj.magic _menhir_stack in
        ((* _menhir_error1 *)
        raise _eRR : 'freshtv78)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 53 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    (* State 2: *)
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEP ->
        (* Shifting (SEP) to state 3 *)
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 67 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) = Obj.magic _menhir_stack in
        ((* _menhir_run3 *)
        (* State 3: *)
        (let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            (* Shifting (VAL) to state 4 *)
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv67 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 80 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 85 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
            )) = _v in
            ((* _menhir_run4 *)
            (* State 4: *)
            (let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEP ->
                (* Shifting (SEP) to state 5 *)
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv63 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 99 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 103 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                )) = Obj.magic _menhir_stack in
                ((* _menhir_run5 *)
                (* State 5: *)
                (let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | VAL _v ->
                    (* Shifting (VAL) to state 6 *)
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv59 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 116 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 120 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    let (_v : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 125 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                    )) = _v in
                    ((* _menhir_run6 *)
                    (* State 6: *)
                    (let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | SEP ->
                        (* Shifting (SEP) to state 7 *)
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv55 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 139 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 143 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 147 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((* _menhir_run7 *)
                        (* State 7: *)
                        (let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | VAL _v ->
                            (* Shifting (VAL) to state 8 *)
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : ((((('freshtv51 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 160 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 164 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 168 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            ))) = Obj.magic _menhir_stack in
                            let (_v : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 173 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            )) = _v in
                            ((* _menhir_run8 *)
                            (* State 8: *)
                            (let _menhir_stack = (_menhir_stack, _v) in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | SEP ->
                                (* Shifting (SEP) to state 9 *)
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : (((((('freshtv47 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 187 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 191 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 195 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 199 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                )) = Obj.magic _menhir_stack in
                                ((* _menhir_run9 *)
                                (* State 9: *)
                                (let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | VAL _v ->
                                    (* Shifting (VAL) to state 10 *)
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : ((((((('freshtv43 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 212 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 216 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 220 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 224 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) = Obj.magic _menhir_stack in
                                    let (_v : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 229 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    )) = _v in
                                    ((* _menhir_run10 *)
                                    (* State 10: *)
                                    (* Not allocating top stack cell *)
                                    (let _menhir_env = _menhir_discard _menhir_env in
                                    (* Reducing without looking ahead at EOF | NL | SEP | VAL _ *)
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : ((((((('freshtv41 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 240 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 244 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 248 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 252 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) = Obj.magic _menhir_stack in
                                    let ((birthday : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 257 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    )) : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 261 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    )) = _v in
                                    ((* _menhir_reduce2 *)
                                    (* Reducing production record -> VAL SEP VAL SEP VAL SEP VAL SEP VAL  *)
                                    (let ((((_menhir_stack, _menhir_s, (last_name : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 268 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))), (first_name : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 272 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))), (gender : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 276 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))), (favourite_colour : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 280 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) = _menhir_stack in
                                    let _8 = () in
                                    let _6 = () in
                                    let _4 = () in
                                    let _2 = () in
                                    let _v : 'tv_record = 
# 25 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
   ( Person.of_string_description ~last_name ~first_name ~gender ~favourite_colour ~birthday )
# 289 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                     in
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : 'freshtv39) = _menhir_stack in
                                    let (_menhir_s : _menhir_state) = _menhir_s in
                                    let (_v : 'tv_record) = _v in
                                    ((* _menhir_goto_record *)
                                    (let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                                    match _menhir_s with
                                    | MenhirState11 ->
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : (('freshtv29 * 'tv_rev_records) * _menhir_state) * _menhir_state * 'tv_record) = Obj.magic _menhir_stack in
                                        ((* _menhir_run12 *)
                                        (* State 12: *)
                                        (assert (not _menhir_env._menhir_error);
                                        let _tok = _menhir_env._menhir_token in
                                        match _tok with
                                        | SEP ->
                                            (* Shifting (SEP) to state 13 *)
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : (('freshtv25 * 'tv_rev_records) * _menhir_state) * _menhir_state * 'tv_record) = Obj.magic _menhir_stack in
                                            ((* _menhir_run13 *)
                                            (* State 13: *)
                                            (let _menhir_env = _menhir_discard _menhir_env in
                                            let _tok = _menhir_env._menhir_token in
                                            match _tok with
                                            | NL ->
                                                (* Shifting (NL) to state 14 *)
                                                let (_menhir_env : _menhir_env) = _menhir_env in
                                                let (_menhir_stack : ((('freshtv21 * 'tv_rev_records) * _menhir_state) * _menhir_state * 'tv_record)) = Obj.magic _menhir_stack in
                                                ((* _menhir_run14 *)
                                                (* State 14: *)
                                                (* Not allocating top stack cell *)
                                                (let _menhir_env = _menhir_discard _menhir_env in
                                                (* Reducing without looking ahead at EOF | SEP | VAL _ *)
                                                let (_menhir_env : _menhir_env) = _menhir_env in
                                                let (_menhir_stack : ((('freshtv19 * 'tv_rev_records) * _menhir_state) * _menhir_state * 'tv_record)) = Obj.magic _menhir_stack in
                                                ((* _menhir_reduce3 *)
                                                (* Reducing production rev_records -> rev_records SEP record SEP NL  *)
                                                (let (((_menhir_stack, (rest : 'tv_rev_records)), _), _, (re : 'tv_record)) = _menhir_stack in
                                                let _5 = () in
                                                let _4 = () in
                                                let _2 = () in
                                                let _v : 'tv_rev_records = 
# 16 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
                                                            ( re :: rest )
# 335 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                                 in
                                                _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv20)) : 'freshtv22)
                                            | _ ->
                                                assert (not _menhir_env._menhir_error);
                                                (* Initiating error handling *)
                                                _menhir_env._menhir_error <- true;
                                                let (_menhir_env : _menhir_env) = _menhir_env in
                                                let (_menhir_stack : ((('freshtv23 * 'tv_rev_records) * _menhir_state) * _menhir_state * 'tv_record)) = Obj.magic _menhir_stack in
                                                ((* _menhir_error13 *)
                                                (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)) : 'freshtv26)
                                        | _ ->
                                            assert (not _menhir_env._menhir_error);
                                            (* Initiating error handling *)
                                            _menhir_env._menhir_error <- true;
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : (('freshtv27 * 'tv_rev_records) * _menhir_state) * _menhir_state * 'tv_record) = Obj.magic _menhir_stack in
                                            ((* _menhir_error12 *)
                                            (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)) : 'freshtv30)
                                    | MenhirState1 ->
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ('freshtv37 * 'tv_rev_records) * _menhir_state * 'tv_record) = Obj.magic _menhir_stack in
                                        ((* _menhir_run16 *)
                                        (* State 16: *)
                                        (assert (not _menhir_env._menhir_error);
                                        let _tok = _menhir_env._menhir_token in
                                        match _tok with
                                        | NL ->
                                            (* Shifting (NL) to state 17 *)
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv33 * 'tv_rev_records) * _menhir_state * 'tv_record) = Obj.magic _menhir_stack in
                                            ((* _menhir_run17 *)
                                            (* State 17: *)
                                            (* Not allocating top stack cell *)
                                            (let _menhir_env = _menhir_discard _menhir_env in
                                            (* Reducing without looking ahead at EOF | SEP | VAL _ *)
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv31 * 'tv_rev_records) * _menhir_state * 'tv_record) = Obj.magic _menhir_stack in
                                            ((* _menhir_reduce4 *)
                                            (* Reducing production rev_records -> rev_records record NL  *)
                                            (let ((_menhir_stack, (rest : 'tv_rev_records)), _, (re : 'tv_record)) = _menhir_stack in
                                            let _3 = () in
                                            let _v : 'tv_rev_records = 
# 17 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
                                                  ( re :: rest )
# 382 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                             in
                                            _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv32)) : 'freshtv34)
                                        | EOF | SEP | VAL _ ->
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv35 * 'tv_rev_records) * _menhir_state * 'tv_record) = Obj.magic _menhir_stack in
                                            ((* _menhir_reduce5 *)
                                            (* Reducing production rev_records -> rev_records record  *)
                                            (let ((_menhir_stack, (rest : 'tv_rev_records)), _, (re : 'tv_record)) = _menhir_stack in
                                            let _v : 'tv_rev_records = 
# 18 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
                                              ( re :: rest )
# 394 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                             in
                                            _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv36)) : 'freshtv38)) : 'freshtv40)) : 'freshtv42)) : 'freshtv44)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    (* Initiating error handling *)
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : ((((((('freshtv45 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 405 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 409 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 413 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 417 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) = Obj.magic _menhir_stack in
                                    ((* _menhir_error9 *)
                                    (let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)) : 'freshtv48)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                (* Initiating error handling *)
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : (((((('freshtv49 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 430 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 434 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 438 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 442 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                )) = Obj.magic _menhir_stack in
                                ((* _menhir_error8 *)
                                (let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)) : 'freshtv52)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            (* Initiating error handling *)
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : ((((('freshtv53 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 455 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 459 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 463 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            ))) = Obj.magic _menhir_stack in
                            ((* _menhir_error7 *)
                            (let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)) : 'freshtv56)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        (* Initiating error handling *)
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv57 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 476 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 480 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 484 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((* _menhir_error6 *)
                        (let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)) : 'freshtv60)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    (* Initiating error handling *)
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv61 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 497 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 501 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((* _menhir_error5 *)
                    (let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)) : 'freshtv64)
            | _ ->
                assert (not _menhir_env._menhir_error);
                (* Initiating error handling *)
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv65 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 514 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 518 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                )) = Obj.magic _menhir_stack in
                ((* _menhir_error4 *)
                (let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)) : 'freshtv68)
        | _ ->
            assert (not _menhir_env._menhir_error);
            (* Initiating error handling *)
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv69 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 531 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((* _menhir_error3 *)
            (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)) : 'freshtv72)
    | _ ->
        assert (not _menhir_env._menhir_error);
        (* Initiating error handling *)
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 544 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) = Obj.magic _menhir_stack in
        ((* _menhir_error2 *)
        (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)

and _menhir_goto_rev_records : _menhir_env -> 'ttv_tail -> 'tv_rev_records -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    (* State should be MenhirState0 *)
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv17 * 'tv_rev_records) = Obj.magic _menhir_stack in
    ((* _menhir_run1 *)
    (* State 1: *)
    (assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        (* Shifting (EOF) to state 15 *)
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * 'tv_rev_records) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState1 in
        ((* _menhir_run15 *)
        (* State 15: *)
        (* Not allocating top stack cell *)
        (* Reducing without looking ahead at # *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * 'tv_rev_records) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((* _menhir_reduce1 *)
        (* Reducing production doc -> rev_records EOF  *)
        (let (_menhir_stack, (it : 'tv_rev_records)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 580 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        ) = 
# 12 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
                           ( it )
# 584 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = _menhir_stack in
        let (_v : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 591 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_goto_doc *)
        (* State should be MenhirState0 *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 600 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_run18 *)
        (* State 18: *)
        (* Not allocating top stack cell *)
        (* Reducing without looking ahead at # *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
        let ((_1 : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 611 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 615 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_reduce0 *)
        (* Accepting *)
        Obj.magic _1 : 'freshtv6)) : 'freshtv8)) : 'freshtv10)) : 'freshtv12)) : 'freshtv14)
    | SEP ->
        (* Shifting (SEP) to state 11 *)
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * 'tv_rev_records) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState1 in
        ((* _menhir_run11 *)
        (* State 11: *)
        (let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            (* Shifting (VAL) to state 2 *)
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            (* Initiating error handling *)
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv16)
    | VAL _v ->
        (* Shifting (VAL) to state 2 *)
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        (* Initiating error handling *)
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1) : 'freshtv18)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and doc : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 663 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((* _menhir_init *)
      (let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((* _menhir_run0 *)
    (* State 0: *)
    (let _menhir_env = _menhir_discard _menhir_env in
    (* Reducing without looking ahead at EOF | SEP | VAL _ *)
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
    ((* _menhir_reduce6 *)
    (* Reducing production rev_records ->  *)
    (let _v : 'tv_rev_records = 
# 19 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
                                    ( [] )
# 691 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
     in
    _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv2)) : 'freshtv4))

# 219 "/Users/ec/Dropbox/Code/wrange/_opam/lib/menhir/standard.mly"
  


# 699 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
