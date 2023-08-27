[@@@ocaml.warning "-69"]
open Sqlite3

type traje = {
    idt: int;
    nome: string;
    quantidade: int;
}


module IntMap = Map.Make(Int)

let fetch_trajes () =
    let db = db_open "db/inventario" in
    let select_sql = "SELECT id, nome, quantidade FROM trajes" in
    let stmt = prepare db select_sql in
    let rec loop acc =
        match step stmt with
        | Rc.ROW ->
            let idt = match Data.to_int (column stmt 0) with
                     | Some i -> i
                     | None -> failwith "ID é NULL na database" in
            let nome = match Data.to_string (column stmt 1) with
                       | Some n -> n
                       | None -> failwith "Nome é NULL na database" in
            let quantidade = match Data.to_int (column stmt 2) with
                     | Some x -> x
                     | None -> failwith "Quantidade é NULL na database" in
            let traje = { idt; nome; quantidade} in
            loop (IntMap.add idt traje acc)
        | _ -> acc
    in
    let results = loop IntMap.empty in
    ignore (finalize stmt);
    ignore (db_close db);
    results

let render_trajes trajes_map =
    IntMap.bindings trajes_map
        |> List.map (fun (idt, traje) ->
            Printf.sprintf
                {|<tr id="traje/%d">
                    <td style="text-align: center;">%s</td>
                    <td style="text-align: center;">%d</td>
                    <td><Button class="btn btn-danger" hx-delete="traje/%d">Remover</Button></td>
                </tr>|}
                idt traje.nome traje.quantidade idt)
        |> String.concat "\n"

let delete_traje id =
    let db = db_open "db/inventario" in
    let delete_sql = "DELETE FROM trajes WHERE id = ?1" in
    let stmt = prepare db delete_sql in
    bind stmt 1 (Data.INT (Int64.of_int id)) |> ignore;
  begin
      try 
          if step stmt <> Rc.DONE then
              failwith "Error deleting row from database"
            with e ->
                finalize stmt |> ignore;
      raise e
  end;
  finalize stmt |> ignore;
  db_close db |> ignore

let header_to_int request =
        (int_of_string request)

let handle_delete_traje request =
        delete_traje request;
        Dream.respond ~status: `OK ""

let add_traje request =
  let%lwt form_fields = Dream.form ~csrf:false request in
  match form_fields with
  | `Ok fields ->
      let db = db_open "db/inventario" in
      let sql = "INSERT INTO trajes (nome, quantidade) VALUES (?, ?)" in
      let stmt = prepare db sql in

      let nome = List.assoc "nome" fields in
      let quantidade = List.assoc "quantidade" fields in
      
      bind stmt 1 (Data.TEXT nome) |> ignore;
      bind stmt 2 (Data.INT (Int64.of_string quantidade)) |> ignore;

      if step stmt <> Rc.DONE then (
        finalize stmt |> ignore;
        db_close db |> ignore;
        Dream.respond ~status:`Internal_Server_Error "Erro inserindo itens!"
      ) else (
        finalize stmt |> ignore;
        db_close db |> ignore;
        Dream.html (fetch_trajes () |> render_trajes |> Pages.tabela)
      )

  | _ ->
      Dream.respond ~status:`Bad_Request "Falha processando formulpario!"

type dancarino = {
    idd: int;
    nome: string;
    telefone: string;
}

let fetch_dancarinos () =
    let db = db_open "db/inventario" in
    let select_sql = "SELECT id, nome, telefone FROM dancarinos" in
    let stmt = prepare db select_sql in
    let rec loop acc =
        match step stmt with
        | Rc.ROW ->
            let idd = match Data.to_int (column stmt 0) with
                     | Some i -> i
                     | None -> failwith "ID é NULL na database" in
            let nome = match Data.to_string (column stmt 1) with
                       | Some n -> n
                       | None -> failwith "Nome é NULL na database" in
            let telefone = match Data.to_string (column stmt 2) with
                     | Some x -> x
                     | None -> failwith "Telefone é NULL na database" in
            let dancarino = { idd; nome; telefone} in
            loop (IntMap.add idd dancarino acc)
        | _ -> acc
    in
    let results = loop IntMap.empty in
    ignore (finalize stmt);
    ignore (db_close db);
    results

let render_dancarinos dancarino_map =
    IntMap.bindings dancarino_map
        |> List.map (fun (idd, dancarino) ->
            Printf.sprintf
                {|<tr id="dacarino/%d">
                    <td style="text-align: center;">%s</td>
                    <td style="text-align: center;">%s</td>
                    <td><Button class="btn btn-danger" hx-delete="dancarino/%d">Remover</Button></td>
                </tr>|}
                idd dancarino.nome dancarino.telefone idd)
        |> String.concat "\n"

let delete_dancarino id =
    let db = db_open "db/inventario" in
    let delete_sql = "DELETE FROM dancarinos WHERE id = ?1" in
    let stmt = prepare db delete_sql in
    bind stmt 1 (Data.INT (Int64.of_int id)) |> ignore;
    begin
        try 
          if step stmt <> Rc.DONE then
            failwith "Error deleting row from database"
        with e ->
            finalize stmt |> ignore;
        raise e
    end;
    finalize stmt |> ignore;
    db_close db |> ignore

let handle_delete_dancarino request =
        delete_dancarino request;
        Dream.respond ~status: `OK ""

let add_dancarino request =
  let%lwt form_fields = Dream.form ~csrf:false request in
  match form_fields with
  | `Ok fields ->
      let db = db_open "db/inventario" in
      let sql = "INSERT INTO dancarinos (nome, telefone) VALUES (?, ?)" in
      let stmt = prepare db sql in

      let nome = List.assoc "nome" fields in
      let telefone = List.assoc "telefone" fields in
      
      bind stmt 1 (Data.TEXT nome) |> ignore;
      bind stmt 2 (Data.TEXT telefone) |> ignore;

      if step stmt <> Rc.DONE then (
        finalize stmt |> ignore;
        db_close db |> ignore;
        Dream.respond ~status:`Internal_Server_Error "Erro inserindo itens!"
      ) else (
        finalize stmt |> ignore;
        db_close db |> ignore;
        Dream.html (fetch_dancarinos() |> render_dancarinos|> Pages.dancarinos)
      )

  | _ ->
      Dream.respond ~status:`Bad_Request "Falha processando formulpario!"

let () =
    Dream.run
    @@ Dream.logger
    @@ Dream.router [

    Dream.get "/" (fun _ ->
        Dream.html (Pages.hello));

    Dream.get "/inicio" (fun _ ->
        Dream.html (Pages.inicio));

    Dream.get "/tabela" (fun _ ->
        Dream.html (fetch_trajes () |> render_trajes |> Pages.tabela));

    Dream.get "/dancarinos" (fun _ ->
        Dream.html (fetch_dancarinos() |> render_dancarinos |> Pages.dancarinos));

    Dream.delete "/traje/:id" (fun request -> 
        (Dream.param request "id") |> header_to_int |> handle_delete_traje);

    Dream.delete "/dancarino/:id" (fun request -> 
        (Dream.param request "id") |> header_to_int |> handle_delete_dancarino);

    Dream.post "/traje" add_traje;

    Dream.post "/dancarino" add_dancarino;
]
