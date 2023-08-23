[@@@ocaml.warning "-69"]
open Sqlite3

type traje = {
    id: int;
    nome: string;
    quantidade: int;
    emprestado: int;
}

module IntMap = Map.Make(Int)

let fetch_trajes () =
    let db = db_open "db/inventario" in
    let select_sql = "SELECT id, nome, quantidade, emprestado FROM trajes" in
    let stmt = prepare db select_sql in
    let rec loop acc =
        match step stmt with
        | Rc.ROW ->
            let id = match Data.to_int (column stmt 0) with
                     | Some i -> i
                     | None -> failwith "ID é NULL na database" in
            let nome = match Data.to_string (column stmt 1) with
                       | Some n -> n
                       | None -> failwith "Nome é NULL na database" in
            let quantidade = match Data.to_int (column stmt 2) with
                     | Some x -> x
                     | None -> failwith "Quantidade é NULL na database" in
            let emprestado = match Data.to_int(column stmt 3) with
                       | Some a -> a
                       | None -> failwith "Emprestado é NULL na database" in
            let traje = { id; nome; quantidade; emprestado } in
            loop (IntMap.add id traje acc)
        | _ -> acc
    in
    let results = loop IntMap.empty in
    ignore (finalize stmt);
    ignore (db_close db);
    results

let render_trajes trajes_map =
    IntMap.bindings trajes_map
        |> List.map (fun (id, traje) ->
            Printf.sprintf
                {|<tr>
                    <td>%d</td>
                    <td>%s</td>
                    <td>%d</td>
                    <td>%d</td>
                </tr>|}
                id traje.nome traje.quantidade traje.emprestado)
        |> String.concat "\n"

let () =
    Dream.run
    @@ Dream.logger
    @@ Dream.router [
    Dream.get "/" (fun _ ->
        Dream.html (Pages.hello));
    Dream.get "/inicio" (fun _ ->
        Dream.html (Pages.inicio));
    Dream.get "/tabela" (fun _ ->
        fetch_trajes () |> render_trajes |> Pages.tabela |> Dream.html);
    ]
