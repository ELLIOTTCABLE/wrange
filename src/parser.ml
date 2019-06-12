
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | VAL of (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 11 "/Users/ec/Sync/Code/wrange/src/parser.ml"
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
  | MenhirState19
  | MenhirState11
  | MenhirState1

let rec _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 39 "/Users/ec/Sync/Code/wrange/src/parser.ml"
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
        let (_menhir_stack : 'freshtv115 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 53 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = Obj.magic _menhir_stack in
        ((* _menhir_run3 *)
        (* State 3: *)
        (let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            (* Shifting (VAL) to state 4 *)
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv111 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 66 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 71 "/Users/ec/Sync/Code/wrange/src/parser.ml"
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
                let (_menhir_stack : (('freshtv107 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 85 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 89 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                )) = Obj.magic _menhir_stack in
                ((* _menhir_run5 *)
                (* State 5: *)
                (let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | VAL _v ->
                    (* Shifting (VAL) to state 6 *)
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv103 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 102 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 106 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    let (_v : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 111 "/Users/ec/Sync/Code/wrange/src/parser.ml"
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
                        let (_menhir_stack : (((('freshtv99 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 125 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 129 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 133 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((* _menhir_run7 *)
                        (* State 7: *)
                        (let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | VAL _v ->
                            (* Shifting (VAL) to state 8 *)
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : ((((('freshtv95 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 146 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 150 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 154 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) = Obj.magic _menhir_stack in
                            let (_v : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 159 "/Users/ec/Sync/Code/wrange/src/parser.ml"
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
                                let (_menhir_stack : (((((('freshtv91 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 173 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 177 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 181 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 185 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                )) = Obj.magic _menhir_stack in
                                ((* _menhir_run9 *)
                                (* State 9: *)
                                (let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | VAL _v ->
                                    (* Shifting (VAL) to state 10 *)
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : ((((((('freshtv87 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 198 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 202 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 206 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 210 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) = Obj.magic _menhir_stack in
                                    let (_v : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 215 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    )) = _v in
                                    ((* _menhir_run10 *)
                                    (* State 10: *)
                                    (* Not allocating top stack cell *)
                                    (let _menhir_env = _menhir_discard _menhir_env in
                                    (* Reducing without looking ahead at EOF | NL | SEP | VAL _ *)
                                    _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack) _v) : 'freshtv88)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    (* Initiating error handling *)
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : ((((((('freshtv89 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 231 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 235 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 239 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 243 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) = Obj.magic _menhir_stack in
                                    ((* _menhir_error9 *)
                                    (let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)) : 'freshtv92)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                (* Initiating error handling *)
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : (((((('freshtv93 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 256 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 260 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 264 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 268 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                )) = Obj.magic _menhir_stack in
                                ((* _menhir_error8 *)
                                (let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)) : 'freshtv96)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            (* Initiating error handling *)
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : ((((('freshtv97 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 281 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 285 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 289 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) = Obj.magic _menhir_stack in
                            ((* _menhir_error7 *)
                            (let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)) : 'freshtv100)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        (* Initiating error handling *)
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (((('freshtv101 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 302 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 306 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 310 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((* _menhir_error6 *)
                        (let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)) : 'freshtv104)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    (* Initiating error handling *)
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv105 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 323 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 327 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((* _menhir_error5 *)
                    (let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)) : 'freshtv108)
            | _ ->
                assert (not _menhir_env._menhir_error);
                (* Initiating error handling *)
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv109 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 340 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 344 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                )) = Obj.magic _menhir_stack in
                ((* _menhir_error4 *)
                (let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)) : 'freshtv112)
        | _ ->
            assert (not _menhir_env._menhir_error);
            (* Initiating error handling *)
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv113 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 357 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((* _menhir_error3 *)
            (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)) : 'freshtv116)
    | _ ->
        assert (not _menhir_env._menhir_error);
        (* Initiating error handling *)
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 370 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = Obj.magic _menhir_stack in
        ((* _menhir_error2 *)
        (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)

and _menhir_goto_rev_records : _menhir_env -> 'ttv_tail -> 'tv_rev_records -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    (* State should be MenhirState0 *)
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv85 * 'tv_rev_records) = Obj.magic _menhir_stack in
    ((* _menhir_run1 *)
    (* State 1: *)
    (assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        (* Shifting (EOF) to state 15 *)
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * 'tv_rev_records) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState1 in
        ((* _menhir_run15 *)
        (* State 15: *)
        (* Not allocating top stack cell *)
        (* Reducing without looking ahead at # *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * 'tv_rev_records) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((* _menhir_reduce2 *)
        (* Reducing production doc -> rev_records EOF  *)
        (let (_menhir_stack, (it : 'tv_rev_records)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 7 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t list)
# 406 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        ) = 
# 13 "/Users/ec/Sync/Code/wrange/src/parser.mly"
                           ( it )
# 410 "/Users/ec/Sync/Code/wrange/src/parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77) = _menhir_stack in
        let (_v : (
# 7 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t list)
# 417 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_goto_doc *)
        (* State should be MenhirState0 *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t list)
# 426 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_run18 *)
        (* State 18: *)
        (* Not allocating top stack cell *)
        (* Reducing without looking ahead at # *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
        let ((_1 : (
# 7 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t list)
# 437 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) : (
# 7 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t list)
# 441 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_reduce0 *)
        (* Accepting *)
        Obj.magic _1 : 'freshtv74)) : 'freshtv76)) : 'freshtv78)) : 'freshtv80)) : 'freshtv82)
    | SEP ->
        (* Shifting (SEP) to state 11 *)
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * 'tv_rev_records) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv84)
    | VAL _v ->
        (* Shifting (VAL) to state 2 *)
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        (* Initiating error handling *)
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1) : 'freshtv86)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67) = Obj.magic _menhir_stack in
        ((* _menhir_error19 *)
        raise _eRR : 'freshtv68)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * 'tv_rev_records) * _menhir_state) = Obj.magic _menhir_stack in
        ((* _menhir_error11 *)
        (let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * 'tv_rev_records) = Obj.magic _menhir_stack in
        ((* _menhir_error1 *)
        raise _eRR : 'freshtv72)

and _menhir_reduce3 : _menhir_env -> ((((((('ttv_tail * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 497 "/Users/ec/Sync/Code/wrange/src/parser.ml"
))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 501 "/Users/ec/Sync/Code/wrange/src/parser.ml"
))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 505 "/Users/ec/Sync/Code/wrange/src/parser.ml"
))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 509 "/Users/ec/Sync/Code/wrange/src/parser.ml"
)) -> (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 513 "/Users/ec/Sync/Code/wrange/src/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack (birthday : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 518 "/Users/ec/Sync/Code/wrange/src/parser.ml"
  )) ->
    (* Reducing production record -> VAL SEP VAL SEP VAL SEP VAL SEP VAL  *)
    let ((((_menhir_stack, _menhir_s, (last_name : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 524 "/Users/ec/Sync/Code/wrange/src/parser.ml"
    ))), (first_name : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 528 "/Users/ec/Sync/Code/wrange/src/parser.ml"
    ))), (gender : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 532 "/Users/ec/Sync/Code/wrange/src/parser.ml"
    ))), (favourite_colour : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 536 "/Users/ec/Sync/Code/wrange/src/parser.ml"
    ))) = _menhir_stack in
    let _8 = () in
    let _6 = () in
    let _4 = () in
    let _2 = () in
    let _v : (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 545 "/Users/ec/Sync/Code/wrange/src/parser.ml"
    ) = 
# 26 "/Users/ec/Sync/Code/wrange/src/parser.mly"
   ( Person.of_string_description ~last_name ~first_name ~gender ~favourite_colour ~birthday )
# 549 "/Users/ec/Sync/Code/wrange/src/parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv65) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 557 "/Users/ec/Sync/Code/wrange/src/parser.ml"
    )) = _v in
    ((* _menhir_goto_record *)
    (let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * 'tv_rev_records) * _menhir_state) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 567 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = Obj.magic _menhir_stack in
        ((* _menhir_run12 *)
        (* State 12: *)
        (assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEP ->
            (* Shifting (SEP) to state 13 *)
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv47 * 'tv_rev_records) * _menhir_state) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 580 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            )) = Obj.magic _menhir_stack in
            ((* _menhir_run13 *)
            (* State 13: *)
            (let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NL ->
                (* Shifting (NL) to state 14 *)
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv43 * 'tv_rev_records) * _menhir_state) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 593 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((* _menhir_run14 *)
                (* State 14: *)
                (* Not allocating top stack cell *)
                (let _menhir_env = _menhir_discard _menhir_env in
                (* Reducing without looking ahead at EOF | SEP | VAL _ *)
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv41 * 'tv_rev_records) * _menhir_state) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 604 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((* _menhir_reduce4 *)
                (* Reducing production rev_records -> rev_records SEP record SEP NL  *)
                (let (((_menhir_stack, (rest : 'tv_rev_records)), _), _, (re : (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 611 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                ))) = _menhir_stack in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _v : 'tv_rev_records = 
# 17 "/Users/ec/Sync/Code/wrange/src/parser.mly"
                                                            ( re :: rest )
# 619 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                 in
                _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv42)) : 'freshtv44)
            | _ ->
                assert (not _menhir_env._menhir_error);
                (* Initiating error handling *)
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv45 * 'tv_rev_records) * _menhir_state) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 630 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((* _menhir_error13 *)
                (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)) : 'freshtv48)
        | _ ->
            assert (not _menhir_env._menhir_error);
            (* Initiating error handling *)
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv49 * 'tv_rev_records) * _menhir_state) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 643 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            )) = Obj.magic _menhir_stack in
            ((* _menhir_error12 *)
            (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)) : 'freshtv52)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * 'tv_rev_records) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 653 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = Obj.magic _menhir_stack in
        ((* _menhir_run16 *)
        (* State 16: *)
        (assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NL ->
            (* Shifting (NL) to state 17 *)
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv55 * 'tv_rev_records) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 666 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            )) = Obj.magic _menhir_stack in
            ((* _menhir_run17 *)
            (* State 17: *)
            (* Not allocating top stack cell *)
            (let _menhir_env = _menhir_discard _menhir_env in
            (* Reducing without looking ahead at EOF | SEP | VAL _ *)
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv53 * 'tv_rev_records) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 677 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            )) = Obj.magic _menhir_stack in
            ((* _menhir_reduce5 *)
            (* Reducing production rev_records -> rev_records record NL  *)
            (let ((_menhir_stack, (rest : 'tv_rev_records)), _, (re : (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 684 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_rev_records = 
# 18 "/Users/ec/Sync/Code/wrange/src/parser.mly"
                                                  ( re :: rest )
# 690 "/Users/ec/Sync/Code/wrange/src/parser.ml"
             in
            _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv54)) : 'freshtv56)
        | EOF | SEP | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv57 * 'tv_rev_records) * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 698 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            )) = Obj.magic _menhir_stack in
            ((* _menhir_reduce6 *)
            (* Reducing production rev_records -> rev_records record  *)
            (let ((_menhir_stack, (rest : 'tv_rev_records)), _, (re : (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 705 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_rev_records = 
# 19 "/Users/ec/Sync/Code/wrange/src/parser.mly"
                                              ( re :: rest )
# 710 "/Users/ec/Sync/Code/wrange/src/parser.ml"
             in
            _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv58)) : 'freshtv60)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 718 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = Obj.magic _menhir_stack in
        ((* _menhir_run29 *)
        (* State 29: *)
        (* Reducing without looking ahead at # *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state * (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 727 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = Obj.magic _menhir_stack in
        ((* _menhir_reduce1 *)
        (* Accepting *)
        (let (_menhir_stack, _menhir_s, (_1 : (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 734 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        ))) = _menhir_stack in
        Obj.magic _1) : 'freshtv62)) : 'freshtv64)) : 'freshtv66)

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

and _menhir_init : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> _menhir_env =
  fun lexer lexbuf ->
    let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and doc : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 7 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t list)
# 763 "/Users/ec/Sync/Code/wrange/src/parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv39) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((* _menhir_run0 *)
    (* State 0: *)
    (let _menhir_env = _menhir_discard _menhir_env in
    (* Reducing without looking ahead at EOF | SEP | VAL _ *)
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv37) = Obj.magic _menhir_stack in
    ((* _menhir_reduce7 *)
    (* Reducing production rev_records ->  *)
    (let _v : 'tv_rev_records = 
# 20 "/Users/ec/Sync/Code/wrange/src/parser.mly"
                                    ( [] )
# 780 "/Users/ec/Sync/Code/wrange/src/parser.ml"
     in
    _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv38)) : 'freshtv40))

and record : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 8 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (Person.t)
# 787 "/Users/ec/Sync/Code/wrange/src/parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv35) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((* _menhir_run19 *)
    (* State 19: *)
    (let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAL _v ->
        (* Shifting (VAL) to state 20 *)
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState19 in
        let (_v : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 806 "/Users/ec/Sync/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_run20 *)
        (* State 20: *)
        (let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEP ->
            (* Shifting (SEP) to state 21 *)
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv29 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 820 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            )) = Obj.magic _menhir_stack in
            ((* _menhir_run21 *)
            (* State 21: *)
            (let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | VAL _v ->
                (* Shifting (VAL) to state 22 *)
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv25 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 833 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                ))) = Obj.magic _menhir_stack in
                let (_v : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 838 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                )) = _v in
                ((* _menhir_run22 *)
                (* State 22: *)
                (let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEP ->
                    (* Shifting (SEP) to state 23 *)
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv21 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 852 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 856 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((* _menhir_run23 *)
                    (* State 23: *)
                    (let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | VAL _v ->
                        (* Shifting (VAL) to state 24 *)
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv17 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 869 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 873 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        ))) = Obj.magic _menhir_stack in
                        let (_v : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 878 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        )) = _v in
                        ((* _menhir_run24 *)
                        (* State 24: *)
                        (let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | SEP ->
                            (* Shifting (SEP) to state 25 *)
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv13 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 892 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 896 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 900 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((* _menhir_run25 *)
                            (* State 25: *)
                            (let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | VAL _v ->
                                (* Shifting (VAL) to state 26 *)
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv9 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 913 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 917 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 921 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                let (_v : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 926 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                )) = _v in
                                ((* _menhir_run26 *)
                                (* State 26: *)
                                (let _menhir_stack = (_menhir_stack, _v) in
                                let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | SEP ->
                                    (* Shifting (SEP) to state 27 *)
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv5 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 940 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 944 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 948 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 952 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    )) = Obj.magic _menhir_stack in
                                    ((* _menhir_run27 *)
                                    (* State 27: *)
                                    (let _menhir_env = _menhir_discard _menhir_env in
                                    let _tok = _menhir_env._menhir_token in
                                    match _tok with
                                    | VAL _v ->
                                        (* Shifting (VAL) to state 28 *)
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv1 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 965 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 969 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 973 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 977 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                        ))) = Obj.magic _menhir_stack in
                                        let (_v : (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 982 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                        )) = _v in
                                        ((* _menhir_run28 *)
                                        (* State 28: *)
                                        (* Not allocating top stack cell *)
                                        (* Reducing without looking ahead at # *)
                                        _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack) _v : 'freshtv2)
                                    | _ ->
                                        assert (not _menhir_env._menhir_error);
                                        (* Initiating error handling *)
                                        _menhir_env._menhir_error <- true;
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv3 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 997 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1001 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1005 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1009 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                        ))) = Obj.magic _menhir_stack in
                                        ((* _menhir_error27 *)
                                        (let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv4)) : 'freshtv6)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    (* Initiating error handling *)
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv7 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1022 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1026 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1030 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1034 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                    )) = Obj.magic _menhir_stack in
                                    ((* _menhir_error26 *)
                                    (let ((((_menhir_stack, _menhir_s, _), _), _), _) = _menhir_stack in
                                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)) : 'freshtv10)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                (* Initiating error handling *)
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv11 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1047 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1051 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1055 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((* _menhir_error25 *)
                                (let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)) : 'freshtv14)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            (* Initiating error handling *)
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv15 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1068 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1072 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1076 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((* _menhir_error24 *)
                            (let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        (* Initiating error handling *)
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv19 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1089 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1093 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((* _menhir_error23 *)
                        (let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)) : 'freshtv22)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    (* Initiating error handling *)
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv23 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1106 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                    ))) * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1110 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((* _menhir_error22 *)
                    (let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)) : 'freshtv26)
            | _ ->
                assert (not _menhir_env._menhir_error);
                (* Initiating error handling *)
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv27 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1123 "/Users/ec/Sync/Code/wrange/src/parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((* _menhir_error21 *)
                (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)) : 'freshtv30)
        | _ ->
            assert (not _menhir_env._menhir_error);
            (* Initiating error handling *)
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv31 * _menhir_state * (
# 2 "/Users/ec/Sync/Code/wrange/src/parser.mly"
       (string)
# 1136 "/Users/ec/Sync/Code/wrange/src/parser.ml"
            )) = Obj.magic _menhir_stack in
            ((* _menhir_error20 *)
            (let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)) : 'freshtv34)
    | _ ->
        assert (not _menhir_env._menhir_error);
        (* Initiating error handling *)
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv36))

# 269 "/Users/ec/Sync/Code/wrange/_opam/lib/menhir/standard.mly"
  

# 1150 "/Users/ec/Sync/Code/wrange/src/parser.ml"
