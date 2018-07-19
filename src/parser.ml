
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

and _menhir_state

let rec _menhir_goto_rev_records : _menhir_env -> 'ttv_tail -> 'tv_rev_records -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    (* State should be MenhirState0 *)
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv65 * 'tv_rev_records) = Obj.magic _menhir_stack in
    ((* _menhir_run1 *)
    (* State 1: *)
    (assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        (* Shifting (EOF) to state 11 *)
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * 'tv_rev_records) = Obj.magic _menhir_stack in
        ((* _menhir_run11 *)
        (* State 11: *)
        (* Not allocating top stack cell *)
        (* Reducing without looking ahead at # *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * 'tv_rev_records) = Obj.magic _menhir_stack in
        ((* _menhir_reduce1 *)
        (* Reducing production doc -> rev_records EOF  *)
        (let (_menhir_stack, (it : 'tv_rev_records)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 61 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        ) = 
# 12 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
                           ( it )
# 65 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = _menhir_stack in
        let (_v : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 72 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_goto_doc *)
        (* State should be MenhirState0 *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 81 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_run14 *)
        (* State 14: *)
        (* Not allocating top stack cell *)
        (* Reducing without looking ahead at # *)
        (let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
        let ((_1 : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 92 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) : (
# 7 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (Person.t list)
# 96 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_reduce0 *)
        (* Accepting *)
        Obj.magic _1 : 'freshtv6)) : 'freshtv8)) : 'freshtv10)) : 'freshtv12)) : 'freshtv14)
    | VAL _v ->
        (* Shifting (VAL) to state 2 *)
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61) = Obj.magic _menhir_stack in
        let (_v : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 108 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
        )) = _v in
        ((* _menhir_run2 *)
        (* State 2: *)
        (let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEP ->
            (* Shifting (SEP) to state 3 *)
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv57 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 122 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
            )) = Obj.magic _menhir_stack in
            ((* _menhir_run3 *)
            (* State 3: *)
            (let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | VAL _v ->
                (* Shifting (VAL) to state 4 *)
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv53 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 135 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                ))) = Obj.magic _menhir_stack in
                let (_v : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 140 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
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
                    let (_menhir_stack : (('freshtv49 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 154 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 158 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((* _menhir_run5 *)
                    (* State 5: *)
                    (let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | VAL _v ->
                        (* Shifting (VAL) to state 6 *)
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv45 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 171 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 175 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        ))) = Obj.magic _menhir_stack in
                        let (_v : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 180 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
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
                            let (_menhir_stack : (((('freshtv41 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 194 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 198 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 202 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((* _menhir_run7 *)
                            (* State 7: *)
                            (let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | VAL _v ->
                                (* Shifting (VAL) to state 8 *)
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv37 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 215 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 219 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 223 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                let (_v : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 228 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
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
                                    let (_menhir_stack : (((((('freshtv33 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 242 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 246 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 250 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 254 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    )) = Obj.magic _menhir_stack in
                                    ((* _menhir_run9 *)
                                    (* State 9: *)
                                    (let _menhir_env = _menhir_discard _menhir_env in
                                    let _tok = _menhir_env._menhir_token in
                                    match _tok with
                                    | VAL _v ->
                                        (* Shifting (VAL) to state 10 *)
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv29 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 267 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 271 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 275 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 279 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) = Obj.magic _menhir_stack in
                                        let (_v : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 284 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        )) = _v in
                                        ((* _menhir_run10 *)
                                        (* State 10: *)
                                        (* Not allocating top stack cell *)
                                        (let _menhir_env = _menhir_discard _menhir_env in
                                        (* Reducing without looking ahead at EOF | NL | VAL _ *)
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv27 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 295 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 299 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 303 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 307 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) = Obj.magic _menhir_stack in
                                        let ((birthday : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 312 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        )) : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 316 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        )) = _v in
                                        ((* _menhir_reduce2 *)
                                        (* Reducing production record -> VAL SEP VAL SEP VAL SEP VAL SEP VAL  *)
                                        (let ((((_menhir_stack, (last_name : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 323 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))), (first_name : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 327 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))), (gender : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 331 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))), (favourite_colour : (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 335 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) = _menhir_stack in
                                        let _8 = () in
                                        let _6 = () in
                                        let _4 = () in
                                        let _2 = () in
                                        let _v : 'tv_record = 
# 24 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
   ( Person.of_string_description ~last_name ~first_name ~gender ~favourite_colour ~birthday )
# 344 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                         in
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : 'freshtv25) = _menhir_stack in
                                        let (_v : 'tv_record) = _v in
                                        ((* _menhir_goto_record *)
                                        (let _menhir_stack = (_menhir_stack, _v) in
                                        (* State should be MenhirState1 *)
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ('freshtv23 * 'tv_rev_records) * 'tv_record) = Obj.magic _menhir_stack in
                                        ((* _menhir_run12 *)
                                        (* State 12: *)
                                        (assert (not _menhir_env._menhir_error);
                                        let _tok = _menhir_env._menhir_token in
                                        match _tok with
                                        | NL ->
                                            (* Shifting (NL) to state 13 *)
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv17 * 'tv_rev_records) * 'tv_record) = Obj.magic _menhir_stack in
                                            ((* _menhir_run13 *)
                                            (* State 13: *)
                                            (* Not allocating top stack cell *)
                                            (let _menhir_env = _menhir_discard _menhir_env in
                                            (* Reducing without looking ahead at EOF | VAL _ *)
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv15 * 'tv_rev_records) * 'tv_record) = Obj.magic _menhir_stack in
                                            ((* _menhir_reduce3 *)
                                            (* Reducing production rev_records -> rev_records record NL  *)
                                            (let ((_menhir_stack, (rest : 'tv_rev_records)), (re : 'tv_record)) = _menhir_stack in
                                            let _3 = () in
                                            let _v : 'tv_rev_records = 
# 16 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
                                                  ( re :: rest )
# 377 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                             in
                                            _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv16)) : 'freshtv18)
                                        | EOF | VAL _ ->
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv19 * 'tv_rev_records) * 'tv_record) = Obj.magic _menhir_stack in
                                            ((* _menhir_reduce4 *)
                                            (* Reducing production rev_records -> rev_records record  *)
                                            (let ((_menhir_stack, (rest : 'tv_rev_records)), (re : 'tv_record)) = _menhir_stack in
                                            let _v : 'tv_rev_records = 
# 17 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
                                              ( re :: rest )
# 389 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                             in
                                            _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv20)
                                        | _ ->
                                            assert (not _menhir_env._menhir_error);
                                            (* Initiating error handling *)
                                            _menhir_env._menhir_error <- true;
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv21 * 'tv_rev_records) * 'tv_record) = Obj.magic _menhir_stack in
                                            ((* _menhir_error12 *)
                                            raise _eRR : 'freshtv22)) : 'freshtv24)) : 'freshtv26)) : 'freshtv28)) : 'freshtv30)
                                    | _ ->
                                        assert (not _menhir_env._menhir_error);
                                        (* Initiating error handling *)
                                        _menhir_env._menhir_error <- true;
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv31 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 408 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 412 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 416 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 420 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                        ))) = Obj.magic _menhir_stack in
                                        ((* _menhir_error9 *)
                                        raise _eRR : 'freshtv32)) : 'freshtv34)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    (* Initiating error handling *)
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv35 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 432 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 436 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 440 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 444 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                    )) = Obj.magic _menhir_stack in
                                    ((* _menhir_error8 *)
                                    raise _eRR : 'freshtv36)) : 'freshtv38)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                (* Initiating error handling *)
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv39 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 456 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 460 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 464 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((* _menhir_error7 *)
                                raise _eRR : 'freshtv40)) : 'freshtv42)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            (* Initiating error handling *)
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv43 * (
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
                            raise _eRR : 'freshtv44)) : 'freshtv46)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        (* Initiating error handling *)
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv47 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 496 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 500 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((* _menhir_error5 *)
                        raise _eRR : 'freshtv48)) : 'freshtv50)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    (* Initiating error handling *)
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv51 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 512 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                    ))) * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 516 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((* _menhir_error4 *)
                    raise _eRR : 'freshtv52)) : 'freshtv54)
            | _ ->
                assert (not _menhir_env._menhir_error);
                (* Initiating error handling *)
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv55 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 528 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((* _menhir_error3 *)
                raise _eRR : 'freshtv56)) : 'freshtv58)
        | _ ->
            assert (not _menhir_env._menhir_error);
            (* Initiating error handling *)
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv59 * (
# 2 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
       (string)
# 540 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
            )) = Obj.magic _menhir_stack in
            ((* _menhir_error2 *)
            raise _eRR : 'freshtv60)) : 'freshtv62)
    | _ ->
        assert (not _menhir_env._menhir_error);
        (* Initiating error handling *)
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * 'tv_rev_records) = Obj.magic _menhir_stack in
        ((* _menhir_error1 *)
        raise _eRR : 'freshtv64)) : 'freshtv66)

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
# 568 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
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
    (* Reducing without looking ahead at EOF | VAL _ *)
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
    ((* _menhir_reduce5 *)
    (* Reducing production rev_records ->  *)
    (let _v : 'tv_rev_records = 
# 18 "/Users/ec/Dropbox/Code/wrange/src/parser.mly"
                                    ( [] )
# 596 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
     in
    _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv2)) : 'freshtv4))

# 219 "/Users/ec/Dropbox/Code/wrange/_opam/lib/menhir/standard.mly"
  


# 604 "/Users/ec/Dropbox/Code/wrange/src/parser.ml"
