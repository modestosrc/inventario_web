[@@@ocaml.warning "-69"]
open Sqlite3


type linha = {
    id: int;
    data1: Data.t;
    data2: Data.t;
}

let database = "db/inventario"
let query_from_trajes = "SELECT id, nome, quantidade FROM trajes"
let query_from_dancarino = "SELECT id, nome, telefone FROM dancarinos"
let delete_from_traje = "DELETE FROM trajes WHERE id = ?1"
let delete_from_dancarino = "DELETE FROM dancarinos WHERE id = ?1"

module IntMap = Map.Make(Int)

(*Query na database
 @return: um mapa de tipo linha, contendo todas as linhas*)
let fetch_database query =
    let db = db_open database in
    let stmt = prepare db query in
    let rec loop acc =
        match step stmt with
        | Rc.ROW ->
            let id = match Data.to_int(column stmt 0) with
                | Some i -> i
                | None -> failwith "Isso não devia acontecer" in
            let data1 = column stmt 1 in
            let data2 = column stmt 2 in
            let linha = { id; data1; data2} in
            loop (IntMap.add id linha acc)
        | _ -> acc
    in
    let resultado = loop IntMap.empty in
    finalize stmt |> ignore;
    db_close db   |> ignore;
    resultado

(*Cria uma string contendo uma tabela html com a lista de trajes*)
let render_traje () =
    let linhas_map = fetch_database query_from_trajes in
    IntMap.bindings linhas_map
        |> List.map (fun (id, linha) ->
            Printf.sprintf
                {|<tr id="traje/%d">
                    <td style="text-align: center;">%s</td>
                    <td style="text-align: center;">%d</td>
                    <td><Button class="btn btn-danger" hx-delete="traje/%d">Remover</Button></td>
                </tr>|}
                id 
                (match (linha.data1 |> Data.to_string) with
                        | Some s -> s
                        | None -> "") 
                (match (linha.data2 |> Data.to_int) with
                        | Some i -> i
                        | None -> 0) 
                id)
        |> String.concat "\n"

(*Cria uma string contendo uma tabela html com a lista de dancarinos*)
let render_dancarino () =
    let linhas_map = fetch_database query_from_dancarino in
    IntMap.bindings linhas_map
        |> List.map (fun (id, linha) ->
            Printf.sprintf
                {|<tr id="dacarino/%d">
                    <td style="text-align: center;">%s</td>
                    <td style="text-align: center;">%s</td>
                    <td><Button class="btn btn-danger" hx-delete="dancarino/%d">Remover</Button></td>
                </tr>|}
                id 
                (match (linha.data1 |> Data.to_string) with
                        | Some s -> s
                        | None -> "") 
                (match (linha.data2 |> Data.to_string) with
                        | Some s -> s
                        | None -> "") 
                id)
        |> String.concat "\n"

let delete_data id query =
    let db = db_open database in
    let stmt = prepare db query in
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
    db_close db |> ignore;
    Dream.respond ~status: `OK ""

let insert_into_trajes = "INSERT INTO trajes (nome, quantidade) VALUES (?, ?)"
let insert_into_dacarinos = "INSERT INTO dancarinos (nome, telefone) VALUES (?, ?)"

let insert_data insert data1 data2 =
    let db = db_open database in
    let stmt = prepare db insert in
      
    bind stmt 1 data1 |> ignore;
    bind stmt 2 data2 |> ignore;

    if step stmt <> Rc.DONE then (
        finalize stmt |> ignore;
        db_close db |> ignore;
        Dream.respond ~status:`Internal_Server_Error "Erro inserindo itens!"
    ) else (
        finalize stmt |> ignore;
        db_close db |> ignore;
        Dream.html (render_traje () |> Pages.tabela)
    )

let add_traje request =
    let%lwt form_fields = Dream.form ~csrf:false request in
    match form_fields with
    | `Ok fields ->
        let nome = List.assoc "nome" fields in
        let quantidade = List.assoc "quantidade" fields in
        let data1 = (Data.TEXT nome) in
        let data2 = (Data.INT (Int64.of_string quantidade)) in
        insert_data insert_into_trajes data1 data2

    | _ ->
        Dream.respond ~status:`Bad_Request "Falha processando formulário!"

let add_dancarino request =
    let%lwt form_fields = Dream.form ~csrf:false request in
    match form_fields with
    | `Ok fields ->
        let nome = List.assoc "nome" fields in
        let telefone = List.assoc "telefone" fields in
        let data1 = (Data.TEXT nome) in
        let data2 = (Data.TEXT telefone) in
        insert_data insert_into_dacarinos data1 data2

    | _ ->
        Dream.respond ~status:`Bad_Request "Falha processando formulário!"

let () =
    Dream.run
    @@ Dream.logger
    @@ Dream.router [

    Dream.get "/" (fun _ ->
        Dream.html (Pages.hello));

    Dream.get "/inicio" (fun _ ->
        Dream.html (Pages.inicio));

    Dream.get "/tabela" (fun _ ->
        Dream.html (render_traje () |> Pages.tabela));

    Dream.get "/dancarinos" (fun _ ->
        Dream.html (render_dancarino () |> Pages.dancarinos));

    Dream.delete "/traje/:id" (fun request -> 
        delete_data ((Dream.param request "id") |> int_of_string) delete_from_traje);

    Dream.delete "/dancarino/:id" (fun request -> 
        delete_data ((Dream.param request "id") |> int_of_string) delete_from_dancarino);

    Dream.post "/traje" add_traje;

    Dream.post "/dancarino" add_dancarino;
]
