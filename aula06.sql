• Liste os títulos e seus status, incluindo os que não têm status
definido. (retorna 6 linhas)
Resposta:

SELECT tbl_titulo.titulo, tbl_livros.status
FROM tbl_titulo
LEFT JOIN tbl_livros ON tbl_titulo.codigo_titulo = tbl_livros.codigo_titulo;
------------------------------------------------------------------------------------
• Liste os títulos e suas descrições dos livros alugados (retorna 4 linhas)
Resposta:

SELECT tbl_titulo.titulo, tbl_titulo.descricao
FROM tbl_titulo
INNER JOIN tbl_livros ON tbl_titulo.codigo_titulo = tbl_livros.codigo_titulo
WHERE tbl_livros.status LIKE 'ALUGADO';
------------------------------------------------------------------------------------
• Liste os nomes clientes que não têm livros alugados (retorna 1 linha)
Resposta:

SELECT tbl_cliente.nome
FROM tbl_cliente
LEFT JOIN tbl_emprestimo ON tbl_cliente.codigo_cliente = tbl_emprestimo.codigo_cliente
WHERE numero_emprestimo is null;
