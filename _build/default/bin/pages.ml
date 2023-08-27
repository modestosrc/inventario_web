#1 "bin/pages.eml.html"
let hello =
let ___eml_buffer = Buffer.create 4096 in
(Buffer.add_string ___eml_buffer "<html lang=\"en\">\n    <head>\n        <meta charset=\"UTF-8\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n        <title>Invetario de Trajes</title>\n        <script src=\"https://unpkg.com/htmx.org\"></script>\n    </head>\n    <nav>\n        <a hx-target=\"#maindiv\" hx-get=\"inicio\" hx-trigger=\"click\">Inicio</a>\n        <a hx-target=\"#maindiv\" hx-get=\"tabela\" hx-trigger=\"click\">Tabela</a>\n        <a hx-target=\"#maindiv\" hx-get=\"dancarinos\" hx-trigger=\"click\">Dan\195\167arinos</a>\n    </nav>\n    <section>\n        <body>\n            <div id=\"maindiv\" hx-get=\"inicio\" hx-trigger=\"load\" hx-target=\"#maindiv\">\n            </div>\n        </body>\n    </section>\n</html>\n\n");
(Buffer.contents ___eml_buffer)
#22 "bin/pages.eml.html"
let inicio =
let ___eml_buffer = Buffer.create 4096 in
(Buffer.add_string ___eml_buffer "<div style=\"text-align: center;\">\n    <br>\n    <a style=\"color: mediumaquamarine; font-size: 200%;\"> Bem vindo! </a>\n    <p style=\"\"> Desenvolvido por: Mateus Felipe da Silva</p>\n    <p style=\"\"> Vers\195\163o: 0.2.0</p>\n</div>\n\n");
(Buffer.contents ___eml_buffer)
#30 "bin/pages.eml.html"
let tabela rows =
let ___eml_buffer = Buffer.create 4096 in
(Buffer.add_string ___eml_buffer "<div>\n    <table>\n        <thead style=\"border: 1px solid black; border-collapse: collapse;\">\n            <tr>\n                <th style=\"text-align: center; width: 25%; border: 1px solid black; border-collapse: collapse;\">Nome</th>\n                <th style=\"text-align: center; width: 25%; border: 1px solid black; border-collapse: collapse;\">Quantidade</th>\n            </tr>\n        </thead>\n        <tbody hx-confirm=\"Voc\195\170 tem certeza?\" hx-target=\"closest tr\" hx-swap=\"outerHTML swap:1s\">\n            <style>\n                tr.htmx-swapping td { opacity: 0; transition: opacity 1s ease-out;}\n            </style>\n            ");
(Printf.bprintf ___eml_buffer "%s" (
#43 "bin/pages.eml.html"
                     rows 
));
(Buffer.add_string ___eml_buffer "\n        </tbody>\n    </table>\n    <form id=\"formnewtraje\" hx-post=\"/traje\">\n        <input name=\"nome\"></input>\n        <input name=\"quantidade\" type=\"number\" min=\"0\" max=\"100\" style=\"width: 50pt;\"></input>\n        <button type=\"submit\">Adicionar</button>\n    </form>\n</div>\n\n");
(Buffer.contents ___eml_buffer)
#53 "bin/pages.eml.html"
let dancarinos rows =
let ___eml_buffer = Buffer.create 4096 in
(Buffer.add_string ___eml_buffer "<div>\n    <table>\n        <thead style=\"border: 1px solid black; border-collapse: collapse;\">\n            <tr>\n                <th style=\"text-align: center; width: 25%; border: 1px solid black; border-collapse: collapse;\">Nome</th>\n                <th style=\"text-align: center; width: 25%; border: 1px solid black; border-collapse: collapse;\">Telefone</th>\n            </tr>\n        </thead>\n        <tbody hx-confirm=\"Voc\195\170 tem certeza?\" hx-target=\"closest tr\" hx-swap=\"outerHTML swap:1s\">\n            <style>\n                tr.htmx-swapping td { opacity: 0; transition: opacity 1s ease-out;}\n            </style>\n            ");
(Printf.bprintf ___eml_buffer "%s" (
#66 "bin/pages.eml.html"
                     rows 
));
(Buffer.add_string ___eml_buffer "\n        </tbody>\n    </table>\n    <form id=\"formnewdancarino\" hx-post=\"/dancarino\">\n        <input name=\"nome\" type=\"text\"></input>\n        <input name=\"telefone\" type=\"text\"></input>\n        <button type=\"submit\">Adicionar</button>\n    </form>\n</div>\n\n\n");
(Buffer.contents ___eml_buffer)
