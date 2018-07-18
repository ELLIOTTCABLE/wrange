
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | VAL of (
# 2 "src/wrange_parser.mly"
       (string)
# 11 "src/wrange_parser.ml"
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
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv63 * 'tv_rev_records) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * 'tv_rev_records) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * 'tv_rev_records) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (it : 'tv_rev_records)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 7 "src/wrange_parser.mly"
       (Person.t list)
# 51 "src/wrange_parser.ml"
        ) = 
# 12 "src/wrange_parser.mly"
                           ( it )
# 55 "src/wrange_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = _menhir_stack in
        let (_v : (
# 7 "src/wrange_parser.mly"
       (Person.t list)
# 62 "src/wrange_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
        let (_v : (
# 7 "src/wrange_parser.mly"
       (Person.t list)
# 69 "src/wrange_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
        let ((_1 : (
# 7 "src/wrange_parser.mly"
       (Person.t list)
# 76 "src/wrange_parser.ml"
        )) : (
# 7 "src/wrange_parser.mly"
       (Person.t list)
# 80 "src/wrange_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv6)) : 'freshtv8)) : 'freshtv10)) : 'freshtv12)) : 'freshtv14)
    | VAL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
        let (_v : (
# 2 "src/wrange_parser.mly"
       (string)
# 89 "src/wrange_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv55 * (
# 2 "src/wrange_parser.mly"
       (string)
# 100 "src/wrange_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | VAL _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv51 * (
# 2 "src/wrange_parser.mly"
       (string)
# 110 "src/wrange_parser.ml"
                ))) = Obj.magic _menhir_stack in
                let (_v : (
# 2 "src/wrange_parser.mly"
       (string)
# 115 "src/wrange_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEP ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv47 * (
# 2 "src/wrange_parser.mly"
       (string)
# 126 "src/wrange_parser.ml"
                    ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 130 "src/wrange_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | VAL _v ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv43 * (
# 2 "src/wrange_parser.mly"
       (string)
# 140 "src/wrange_parser.ml"
                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 144 "src/wrange_parser.ml"
                        ))) = Obj.magic _menhir_stack in
                        let (_v : (
# 2 "src/wrange_parser.mly"
       (string)
# 149 "src/wrange_parser.ml"
                        )) = _v in
                        ((let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | SEP ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv39 * (
# 2 "src/wrange_parser.mly"
       (string)
# 160 "src/wrange_parser.ml"
                            ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 164 "src/wrange_parser.ml"
                            ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 168 "src/wrange_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | VAL _v ->
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv35 * (
# 2 "src/wrange_parser.mly"
       (string)
# 178 "src/wrange_parser.ml"
                                ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 182 "src/wrange_parser.ml"
                                ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 186 "src/wrange_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                let (_v : (
# 2 "src/wrange_parser.mly"
       (string)
# 191 "src/wrange_parser.ml"
                                )) = _v in
                                ((let _menhir_stack = (_menhir_stack, _v) in
                                let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | SEP ->
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv31 * (
# 2 "src/wrange_parser.mly"
       (string)
# 202 "src/wrange_parser.ml"
                                    ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 206 "src/wrange_parser.ml"
                                    ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 210 "src/wrange_parser.ml"
                                    ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 214 "src/wrange_parser.ml"
                                    )) = Obj.magic _menhir_stack in
                                    ((let _menhir_env = _menhir_discard _menhir_env in
                                    let _tok = _menhir_env._menhir_token in
                                    match _tok with
                                    | VAL _v ->
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv27 * (
# 2 "src/wrange_parser.mly"
       (string)
# 224 "src/wrange_parser.ml"
                                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 228 "src/wrange_parser.ml"
                                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 232 "src/wrange_parser.ml"
                                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 236 "src/wrange_parser.ml"
                                        ))) = Obj.magic _menhir_stack in
                                        let (_v : (
# 2 "src/wrange_parser.mly"
       (string)
# 241 "src/wrange_parser.ml"
                                        )) = _v in
                                        ((let _menhir_env = _menhir_discard _menhir_env in
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv25 * (
# 2 "src/wrange_parser.mly"
       (string)
# 248 "src/wrange_parser.ml"
                                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 252 "src/wrange_parser.ml"
                                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 256 "src/wrange_parser.ml"
                                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 260 "src/wrange_parser.ml"
                                        ))) = Obj.magic _menhir_stack in
                                        let ((birthday : (
# 2 "src/wrange_parser.mly"
       (string)
# 265 "src/wrange_parser.ml"
                                        )) : (
# 2 "src/wrange_parser.mly"
       (string)
# 269 "src/wrange_parser.ml"
                                        )) = _v in
                                        ((let ((((_menhir_stack, (last_name : (
# 2 "src/wrange_parser.mly"
       (string)
# 274 "src/wrange_parser.ml"
                                        ))), (first_name : (
# 2 "src/wrange_parser.mly"
       (string)
# 278 "src/wrange_parser.ml"
                                        ))), (gender : (
# 2 "src/wrange_parser.mly"
       (string)
# 282 "src/wrange_parser.ml"
                                        ))), (favourite_colour : (
# 2 "src/wrange_parser.mly"
       (string)
# 286 "src/wrange_parser.ml"
                                        ))) = _menhir_stack in
                                        let _8 = () in
                                        let _6 = () in
                                        let _4 = () in
                                        let _2 = () in
                                        let _v : 'tv_record = 
# 23 "src/wrange_parser.mly"
   ( Person.of_string_description ~last_name ~first_name ~gender ~favourite_colour ~birthday )
# 295 "src/wrange_parser.ml"
                                         in
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : 'freshtv23) = _menhir_stack in
                                        let (_v : 'tv_record) = _v in
                                        ((let _menhir_stack = (_menhir_stack, _v) in
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ('freshtv21 * 'tv_rev_records) * 'tv_record) = Obj.magic _menhir_stack in
                                        ((assert (not _menhir_env._menhir_error);
                                        let _tok = _menhir_env._menhir_token in
                                        match _tok with
                                        | NL ->
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv17 * 'tv_rev_records) * 'tv_record) = Obj.magic _menhir_stack in
                                            ((let _menhir_env = _menhir_discard _menhir_env in
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv15 * 'tv_rev_records) * 'tv_record) = Obj.magic _menhir_stack in
                                            ((let ((_menhir_stack, (rest : 'tv_rev_records)), (re : 'tv_record)) = _menhir_stack in
                                            let _3 = () in
                                            let _v : 'tv_rev_records = 
# 16 "src/wrange_parser.mly"
                                                  ( re :: rest )
# 317 "src/wrange_parser.ml"
                                             in
                                            _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv16)) : 'freshtv18)
                                        | _ ->
                                            assert (not _menhir_env._menhir_error);
                                            _menhir_env._menhir_error <- true;
                                            let (_menhir_env : _menhir_env) = _menhir_env in
                                            let (_menhir_stack : ('freshtv19 * 'tv_rev_records) * 'tv_record) = Obj.magic _menhir_stack in
                                            (raise _eRR : 'freshtv20)) : 'freshtv22)) : 'freshtv24)) : 'freshtv26)) : 'freshtv28)
                                    | _ ->
                                        assert (not _menhir_env._menhir_error);
                                        _menhir_env._menhir_error <- true;
                                        let (_menhir_env : _menhir_env) = _menhir_env in
                                        let (_menhir_stack : ((((((('freshtv29 * (
# 2 "src/wrange_parser.mly"
       (string)
# 333 "src/wrange_parser.ml"
                                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 337 "src/wrange_parser.ml"
                                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 341 "src/wrange_parser.ml"
                                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 345 "src/wrange_parser.ml"
                                        ))) = Obj.magic _menhir_stack in
                                        (raise _eRR : 'freshtv30)) : 'freshtv32)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv33 * (
# 2 "src/wrange_parser.mly"
       (string)
# 355 "src/wrange_parser.ml"
                                    ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 359 "src/wrange_parser.ml"
                                    ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 363 "src/wrange_parser.ml"
                                    ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 367 "src/wrange_parser.ml"
                                    )) = Obj.magic _menhir_stack in
                                    (raise _eRR : 'freshtv34)) : 'freshtv36)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv37 * (
# 2 "src/wrange_parser.mly"
       (string)
# 377 "src/wrange_parser.ml"
                                ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 381 "src/wrange_parser.ml"
                                ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 385 "src/wrange_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                (raise _eRR : 'freshtv38)) : 'freshtv40)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv41 * (
# 2 "src/wrange_parser.mly"
       (string)
# 395 "src/wrange_parser.ml"
                            ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 399 "src/wrange_parser.ml"
                            ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 403 "src/wrange_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            (raise _eRR : 'freshtv42)) : 'freshtv44)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv45 * (
# 2 "src/wrange_parser.mly"
       (string)
# 413 "src/wrange_parser.ml"
                        ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 417 "src/wrange_parser.ml"
                        ))) = Obj.magic _menhir_stack in
                        (raise _eRR : 'freshtv46)) : 'freshtv48)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv49 * (
# 2 "src/wrange_parser.mly"
       (string)
# 427 "src/wrange_parser.ml"
                    ))) * (
# 2 "src/wrange_parser.mly"
       (string)
# 431 "src/wrange_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv50)) : 'freshtv52)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv53 * (
# 2 "src/wrange_parser.mly"
       (string)
# 441 "src/wrange_parser.ml"
                ))) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv54)) : 'freshtv56)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv57 * (
# 2 "src/wrange_parser.mly"
       (string)
# 451 "src/wrange_parser.ml"
            )) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv58)) : 'freshtv60)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * 'tv_rev_records) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv62)) : 'freshtv64)

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
# 7 "src/wrange_parser.mly"
       (Person.t list)
# 476 "src/wrange_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rev_records = 
# 17 "src/wrange_parser.mly"
                                    ( [] )
# 498 "src/wrange_parser.ml"
     in
    _menhir_goto_rev_records _menhir_env _menhir_stack _v) : 'freshtv2)) : 'freshtv4))

# 219 "/Users/ec/Dropbox/Code/wrange/_opam/lib/menhir/standard.mly"
  


# 506 "src/wrange_parser.ml"
