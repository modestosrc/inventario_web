let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" (fun _ ->
        Dream.html (Pages.hello));
    Dream.get "/inicio" (fun _ ->
        Dream.html (Pages.inicio));
    Dream.get "/tabela" (fun _ ->
        Dream.html (Pages.tabela));
  ]
