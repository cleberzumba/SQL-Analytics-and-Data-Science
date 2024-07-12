


-- Liste todos os livros vendidos e seus respectivos autores.
SELECT l.titulo AS "Nome do Livro", a.nome AS "Nome do Autor"
FROM livros AS l
INNER JOIN livros_vendidos AS la ON l.id_livro = la.id_livro
INNER JOIN autores AS a ON a.id_autor = la.id_autor;


-- Liste todos os autores e seus respectivos livros, incluindo autores que não têm livros cadastrados.
SELECT a.nome AS "Nome do Autor", COALESCE(l.titulo, 'Nenhum livro associado') AS "Nome do Livro"
FROM autores AS a
LEFT JOIN livros_vendidos AS la ON a.id_autor = la.id_autor
LEFT JOIN livros AS l ON l.id_livro = la.id_livro;


-- Liste todos os livros e seus respectivos autores, incluindo livros que não têm autores cadastrados.
SELECT l.titulo AS "Nome do Livro", COALESCE(a.nome, 'Nenhum autor associado') AS "Nome do Autor"
FROM autores AS a
RIGHT JOIN livros_vendidos AS la ON a.id_autor = la.id_autor
RIGHT JOIN livros AS l ON l.id_livro = la.id_livro;











