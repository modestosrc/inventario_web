Caml1999M032����            ,bin/pages.ml����  $  �  c  ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@�����@�����%hello��2bin/pages.eml.htmlAX\�AXa@��AX\�AXa@@@��@�����-___eml_buffer��Bdh�Bdu@��Bdh�Bdu@@@�������&Buffer&create��Bdx�Bd E@��!Bdx�"Bd E@@@��@���$4096@��*Bd F�+Bd J@@@@��-Bdx�.Bd J@@@@��0Bdd�1Bd J@@�  �������&Buffer*add_string��>C N O�?C N `@��AC N O�BC N `@@@��@����-___eml_buffer��KC N a�LC N n@��NC N a�OC N n@@@��@���
  t<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Invetario de Trajes</title>
        <script src="https://unpkg.com/htmx.org"></script>
    </head>
    <nav>
        <a hx-target="#maindiv" hx-get="inicio" hx-trigger="click">Inicio</a>
        <a hx-target="#maindiv" hx-get="tabela" hx-trigger="click">Tabela</a>
    </nav>
    <aside>
    </aside>
    <section>
        <body>
            <div id="maindiv" hx-get="inicio" hx-trigger="load" hx-target="#maindiv">
            </div>
        </body>
    </section>
</html>

��WC N p�XC N@@��ZC N o�[C N@@@@��]C N N�^C N@���aC N O�bC N@@@�������&Buffer(contents��mD�nD+@��pD�qD+@@@��@����-___eml_buffer��zD,�{D9@��}D,�~D9@@@@���D��D:@����D��D9@@@���C N N��D:@@@���Bdd��D:@@@@���AXX��D:@@���AXX��D:@���@�����&inicio��2bin/pages.eml.htmlWTX�WT^@��WTX�WT^@@@��@�����-___eml_buffer��Xae�Xar@��Xae�Xar@@@�������&Buffer&create��Xau�Xa�@��!Xau�"Xa�@@@��@���$4096@��*Xa��+Xa�@@@@��-Xau�.Xa�@@@@��0Xaa�1Xa�@@�  �������&Buffer*add_string��>Y���?Y��@��AY���BY��@@@��@����-___eml_buffer��KY���LY��@��NY���OY��@@@��@���	�<div style="text-align: center;">
    <br>
    <a style="color: mediumaquamarine; font-size: 200%;"> Bem vindo! </a>
    <p style=""> Desenvolvido por: Mateus Felipe da Silva</p>
    <p style=""> Versão: 0.2.0</p>
</div>

��WY���XY��@@��ZY���[Y��@@@@��]Y���^Y��@���aY���bY��@@@�������&Buffer(contents��mZ���nZ��@��pZ���qZ��@@@��@����-___eml_buffer��zZ���{Z��@��}Z���~Z��@@@@���Z����Z��@����Z����Z��@@@���Y����Z��@@@���Xaa��Z��@@@@���WTT��Z��@@���WTT��Z��@���@�����&tabela��2bin/pages.eml.html_���_��@��_���_��@@@��@@���$rows��_���_��@��_���_��@@@��@�����-___eml_buffer��`���`�@��`���`�@@@�������&Buffer&create��*`��+`�@��-`��.`�@@@��@���$4096@��6`��7`�@@@@��9`��:`�@@@@��<`���=`�@@�  �������&Buffer*add_string��Ja�Ka,@��Ma�Na,@@@��@����-___eml_buffer��Wa-�Xa:@��Za-�[a:@@@��@���	�<div>
    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Quantidade</th>
            <th>Emprestado</th>
        </tr>
        ��ca<�da�@@��fa;�ga�@@@@��ia�ja�@���ma�na�@@@�  �������&Printf'bprintf��{b���|b��@��~b���b��@@@��@����-___eml_buffer���b����b�@���b����b�@@@��@���"%s���b���b�@@���b���b�@@@��@����$rows��2bin/pages.eml.htmlh->�h-B@���b��iDE@���h->�	h-B@@@@���b���iDF@����b���iDE@@@�  �������&Buffer*add_string��jHI�jHZ@�� jHI�!jHZ@@@��@����-___eml_buffer��*jH[�+jHh@��-jH[�.jHh@@@��@���5
    </table>
</div>
��6jHj�7jH�@@��9jHi�:jH�@@@@��<jHH�=jH�@���@jHI�AjH�@@@�������&Buffer(contents��Lk���Mk��@��Ok���Pk��@@@��@����-___eml_buffer��Yk���Zk��@��\k���]k��@@@@��_k���`k��@���ck���dk��@@@��fjHH�gk��@@@��
b���jk��@@@��a�mk��@@@��`���pk��@@@��_���sk��A@@@��_���vk��@@��_���yk��@@