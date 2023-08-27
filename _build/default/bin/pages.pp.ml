Caml1999M032����            ,bin/pages.ml����  �    �  ᠠ���1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@�����@�����%hello��2bin/pages.eml.htmlAX\�AXa@��AX\�AXa@@@��@�����-___eml_buffer��Bdh�Bdu@��Bdh�Bdu@@@�������&Buffer&create��Bdx�Bd E@��!Bdx�"Bd E@@@��@���$4096@��*Bd F�+Bd J@@@@��-Bdx�.Bd J@@@@��0Bdd�1Bd J@@�  �������&Buffer*add_string��>C N O�?C N `@��AC N O�BC N `@@@��@����-___eml_buffer��KC N a�LC N n@��NC N a�OC N n@@@��@���
  �<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Invetario de Trajes</title>
        <script src="https://unpkg.com/htmx.org"></script>
    </head>
    <nav>
        <a hx-target="#maindiv" hx-get="inicio" hx-trigger="click">Inicio</a>
        <a hx-target="#maindiv" hx-get="tabela" hx-trigger="click">Tabela</a>
        <a hx-target="#maindiv" hx-get="dancarinos" hx-trigger="click">Dançarinos</a>
    </nav>
    <section>
        <body>
            <div id="maindiv" hx-get="inicio" hx-trigger="load" hx-target="#maindiv">
            </div>
        </body>
    </section>
</html>

��WC N p�XC N`@@��ZC N o�[C Na@@@@��]C N N�^C Nb@���aC N O�bC Na@@@�������&Buffer(contents��mDde�nDdt@��pDde�qDdt@@@��@����-___eml_buffer��zDdu�{Dd�@��}Ddu�~Dd�@@@@���Ddd��Dd�@����Dde��Dd�@@@���C N N��Dd�@@@���Bdd��Dd�@@@@���AXX��Dd�@@���AXX��Dd�@���@�����&inicio��2bin/pages.eml.htmlV���V��@��V���V��@@@��@�����-___eml_buffer��W���W��@��W���W��@@@�������&Buffer&create��W���W��@��!W���"W��@@@��@���$4096@��*W���+W��@@@@��-W���.W��@@@@��0W���1W��@@�  �������&Buffer*add_string��>X���?X��@��AX���BX��@@@��@����-___eml_buffer��KX���LX��@��NX���OX��@@@��@���	�<div style="text-align: center;">
    <br>
    <a style="color: mediumaquamarine; font-size: 200%;"> Bem vindo! </a>
    <p style=""> Desenvolvido por: Mateus Felipe da Silva</p>
    <p style=""> Versão: 0.2.0</p>
</div>

��WX���XX��@@��ZX���[X��@@@@��]X���^X��@���aX���bX��@@@�������&Buffer(contents��mY���nY��@��pY���qY��@@@��@����-___eml_buffer��zY���{Y�@��}Y���~Y�@@@@���Y����Y�@����Y����Y�@@@���X����Y�@@@���W����Y�@@@@���V����Y�@@���V����Y�@���@�����&tabela��2bin/pages.eml.html^'+�^'1@��^'+�^'1@@@��@@���$rows��^'2�^'6@��^'2�^'6@@@��@�����-___eml_buffer��_9=�_9J@��_9=�_9J@@@�������&Buffer&create��*_9M�+_9Z@��-_9M�._9Z@@@��@���$4096@��6_9[�7_9_@@@@��9_9M�:_9_@@@@��<_99�=_9_@@�  �������&Buffer*add_string��J`cd�K`cu@��M`cd�N`cu@@@��@����-___eml_buffer��W`cv�X`c�@��Z`cv�[`c�@@@��@���
  x<div>
    <table>
        <thead style="border: 1px solid black; border-collapse: collapse;">
            <tr>
                <th style="text-align: center; width: 25%; border: 1px solid black; border-collapse: collapse;">Nome</th>
                <th style="text-align: center; width: 25%; border: 1px solid black; border-collapse: collapse;">Quantidade</th>
            </tr>
        </thead>
        <tbody hx-confirm="Você tem certeza?" hx-target="closest tr" hx-swap="outerHTML swap:1s">
            <style>
                tr.htmx-swapping td { opacity: 0; transition: opacity 1s ease-out;}
            </style>
            ��c`c��d`c@@��f`c��g`c@@@@��i`cc�j`c@���m`cd�n`c@@@�  �������&Printf'bprintf��{a �|a.@��~a �a.@@@��@����-___eml_buffer���a/��a<@���a/��a<@@@��@���"%s���a>��a@@@���a=��aA@@@��@����$rows��2bin/pages.eml.htmlk]r�k]v@���aB�lxy@���k]r�	k]v@@@@���a�lxz@����a �lxy@@@�  �������&Buffer*add_string��m|}�m|�@�� m|}�!m|�@@@��@����-___eml_buffer��*m|��+m|�@��-m|��.m|�@@@��@���
  
        </tbody>
    </table>
    <form id="formnewtraje" hx-post="/traje">
        <input name="nome"></input>
        <input name="quantidade" type="number" min="0" max="100" style="width: 50pt;"></input>
        <button type="submit">Adicionar</button>
    </form>
</div>

��6m|��7m|	�@@��9m|��:m|	�@@@@��<m||�=m|	�@���@m|}�Am|	�@@@�������&Buffer(contents��Ln	�	��Mn	�	�@��On	�	��Pn	�	�@@@��@����-___eml_buffer��Yn	�	��Zn	�	�@��\n	�	��]n	�	�@@@@��_n	�	��`n	�	�@���cn	�	��dn	�	�@@@��fm||�gn	�	�@@@��
a�jn	�	�@@@��`cc�mn	�	�@@@��_99�pn	�	�@@@��^'2�sn	�	�A@@@��^''�vn	�	�@@��^''�yn	�	�@���@�����*dancarinos��2bin/pages.eml.htmlu

�u

@��u

�u

@@@��@@���$rows��u

�u

@��u

�u

@@@��@�����-___eml_buffer��v
"
&�v
"
3@��v
"
&�v
"
3@@@�������&Buffer&create��*v
"
6�+v
"
C@��-v
"
6�.v
"
C@@@��@���$4096@��6v
"
D�7v
"
H@@@@��9v
"
6�:v
"
H@@@@��<v
"
"�=v
"
H@@�  �������&Buffer*add_string��Jw
L
M�Kw
L
^@��Mw
L
M�Nw
L
^@@@��@����-___eml_buffer��Ww
L
_�Xw
L
l@��Zw
L
_�[w
L
l@@@��@���
  v<div>
    <table>
        <thead style="border: 1px solid black; border-collapse: collapse;">
            <tr>
                <th style="text-align: center; width: 25%; border: 1px solid black; border-collapse: collapse;">Nome</th>
                <th style="text-align: center; width: 25%; border: 1px solid black; border-collapse: collapse;">Telefone</th>
            </tr>
        </thead>
        <tbody hx-confirm="Você tem certeza?" hx-target="closest tr" hx-swap="outerHTML swap:1s">
            <style>
                tr.htmx-swapping td { opacity: 0; transition: opacity 1s ease-out;}
            </style>
            ��cw
L
n�dw
L@@��fw
L
m�gw
L@@@@��iw
L
L�jw
L@���mw
L
M�nw
L@@@�  �������&Printf'bprintf��{x�|x@��~x�x@@@��@����-___eml_buffer���x��x#@���x��x#@@@��@���"%s���x%��x'@@���x$��x(@@@��@����$rows��2bin/pages.eml.html BDY� BD]@���x)� C_`@��� BDY�	 BD]@@@@���x� C_a@����x� C_`@@@�  �������&Buffer*add_string�� Dcd� Dcu@��  Dcd�! Dcu@@@��@����-___eml_buffer��* Dcv�+ Dc�@��- Dcv�. Dc�@@@��@���	�
        </tbody>
    </table>
    <form id="formnewdancarino" hx-post="/dancarino">
        <input name="nome" type="text"></input>
        <input name="telefone" type="text"></input>
        <button type="submit">Adicionar</button>
    </form>
</div>


��6 Dc��7 Dc�@@��9 Dc��: Dc�@@@@��< Dcc�= Dc�@���@ Dcd�A Dc�@@@�������&Buffer(contents��L E���M E��@��O E���P E��@@@��@����-___eml_buffer��Y E���Z E��@��\ E���] E��@@@@��_ E���` E��@���c E���d E��@@@��f Dcc�g E��@@@��
x�j E��@@@��w
L
L�m E��@@@��v
"
"�p E��@@@��u

�s E��A@@@��u

�v E��@@��u

�y E��@@