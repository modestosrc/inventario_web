#1 "bin/pages.eml.html"
let hello =
let ___eml_buffer = Buffer.create 4096 in
(Buffer.add_string ___eml_buffer "<html lang=\"en\">\n    <head>\n        <meta charset=\"UTF-8\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n        <title>HTMX e OCaml</title>\n        <script src=\"https://unpkg.com/htmx.org\"></script>\n    </head>\n    <nav>\n        <a hx-target=\"#maindiv\" hx-get=\"inicio\" hx-trigger=\"click\">Inicio</a>\n        <a hx-target=\"#maindiv\" hx-get=\"tabela\" hx-trigger=\"click\">Tabela</a>\n    </nav>\n    <aside>\n    </aside>\n    <section>\n        <body>\n            <div id=\"maindiv\" hx-get=\"inicio\" hx-trigger=\"load\" hx-target=\"#maindiv\">\n            </div>\n        </body>\n    </section>\n</html>\n\n");
(Buffer.contents ___eml_buffer)
#23 "bin/pages.eml.html"
let inicio =
let ___eml_buffer = Buffer.create 4096 in
(Buffer.add_string ___eml_buffer "<div style=\"text-align: center;\">\n    <br>\n    <a style=\"color: mediumaquamarine; font-size: 200%;\"> Bem vindo! </a>\n    <p style=\"\"> Desenvolvido por: Mateus Felipe da Silva</p>\n    <p style=\"\"> Vers\195\163o: 0.1.0</p>\n</div>\n\n");
(Buffer.contents ___eml_buffer)
#31 "bin/pages.eml.html"
let tabela =
let ___eml_buffer = Buffer.create 4096 in
(Buffer.add_string ___eml_buffer "<div>\n    <table>\n        <tr>\n            <th>1</th>\n            <th>2</th>\n            <th>3</th>\n        </tr>\n        <tr>\n            <th>4</th>\n            <th>5</th>\n            <th>6</th>\n        </tr>\n        <tr>\n            <th>7</th>\n            <th>8</th>\n            <th>9</th>\n        </tr>\n    </table>\n</div>\n");
(Buffer.contents ___eml_buffer)
