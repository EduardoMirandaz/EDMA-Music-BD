
-- USUARIO

INSERT INTO USUARIO (nomeDeUsuario, email, senha, ultimasSenhas, dataHoraCriacao)
VALUES ('jose123', 'jose123@gmail.com', '123456', '456789,987654', '2022-05-08 10:30:00');

INSERT INTO USUARIO (nomeDeUsuario, email, senha, ultimasSenhas, dataHoraCriacao)
VALUES ('joao123', 'joao123@gmail.com', '123456', '456789,987654', '2022-09-08 10:30:00');

INSERT INTO USUARIO (nomeDeUsuario, email, senha, ultimasSenhas, dataHoraCriacao)
VALUES ('maria456', 'maria456@gmail.com', 'abc123', 'def456,ghi789', '2022-04-12 18:15:00');

INSERT INTO USUARIO (nomeDeUsuario, email, senha, ultimasSenhas, dataHoraCriacao)
VALUES ('maria_silva', '_maria@gmail.com', 'abc123', 'def456,ghi789', '2022-04-12 18:15:00');

INSERT INTO USUARIO (nomeDeUsuario, email, senha, ultimasSenhas, dataHoraCriacao)
VALUES ('pedro_garcia', 'pedroca@gmail.com', 'abc123', 'def456,ghi789', '2022-04-12 18:15:00');

INSERT INTO USUARIO (nomeDeUsuario, email, senha, ultimasSenhas, dataHoraCriacao)
VALUES ('_thedraude', 'thed@gmail.com', 'abc123', 'def456,ghi789', '2022-04-12 18:15:00');

INSERT INTO USUARIO (nomeDeUsuario, email, senha, ultimasSenhas, dataHoraCriacao)
VALUES ('ana22', 'ana22@hotmail.com', 'senha123', 'senha456,senha789', '2021-12-31 23:59:00');

-- PERFIL

INSERT INTO PERFIL (nomeDeUsuarioDonoDoPerfil, nomeDoPerfil, urlFotoDePerfil, quantidadeDeSeguidores, quantidadeTotalLikesEmPublicacoes, dataHoraUltimaModificacao)
VALUES ('jose123', 'Perfil do José', 'https://url.da.foto/jose123.jpg', 10, 50, '2022-05-08 10:30:00');

INSERT INTO PERFIL (nomeDeUsuarioDonoDoPerfil, nomeDoPerfil, urlFotoDePerfil, quantidadeDeSeguidores, quantidadeTotalLikesEmPublicacoes, dataHoraUltimaModificacao)
VALUES ('maria456', 'Perfil da Maria', 'https://url.da.foto/maria456.jpg', 30, 100, '2022-04-12 18:15:00');

INSERT INTO PERFIL (nomeDeUsuarioDonoDoPerfil, nomeDoPerfil, urlFotoDePerfil, quantidadeDeSeguidores, quantidadeTotalLikesEmPublicacoes, dataHoraUltimaModificacao)
VALUES ('ana22', 'Perfil da Ana', 'https://url.da.foto/ana22.jpg', 5, 20, '2021-12-31 23:59:00');

INSERT INTO PERFIL (nomeDeUsuarioDonoDoPerfil, nomeDoPerfil, urlFotoDePerfil, quantidadeDeSeguidores, quantidadeTotalLikesEmPublicacoes, dataHoraUltimaModificacao)
VALUES ('joao123', 'Perfil do Jao', 'https://url.da.foto/jaojao32.jpg', 9391232, 89312, '2024-12-31 23:59:00');

INSERT INTO PERFIL (nomeDeUsuarioDonoDoPerfil, nomeDoPerfil, urlFotoDePerfil, quantidadeDeSeguidores, quantidadeTotalLikesEmPublicacoes, dataHoraUltimaModificacao)
VALUES ('pedro_garcia', 'Perfil do Jao', 'https://url.da.foto/jaojao32.jpg', 9391232, 89312, '2024-12-31 23:59:00');

INSERT INTO PERFIL (nomeDeUsuarioDonoDoPerfil, nomeDoPerfil, urlFotoDePerfil, quantidadeDeSeguidores, quantidadeTotalLikesEmPublicacoes, dataHoraUltimaModificacao)
VALUES ('maria_silva', 'Perfil da Maria Silva', 'https://url.da.foto/jaojao32.jpg', 9391232, 89312, '2024-12-31 23:59:00');

INSERT INTO PERFIL (nomeDeUsuarioDonoDoPerfil, nomeDoPerfil, urlFotoDePerfil, quantidadeDeSeguidores, quantidadeTotalLikesEmPublicacoes, dataHoraUltimaModificacao)
VALUES ('_thedraude', 'Perfil do ADM', 'https://url.da.foto/thed.jpg', 9391232, 89312, '2021-12-31 23:59:00');

-- PUBLICACAO

INSERT INTO PUBLICACAO (nomeDeUsuarioPerfil, titulo, conteudoEmTexto, coAutor1, coAutor2, usuarioAutorDaPublicacao) VALUES
('pedro_garcia', 'Filme incrível que assisti ontem', 'Ontem assisti a um filme incrível chamado "O Poderoso Chefão", recomendo a todos!', 'joao123', 'maria_silva', 'pedro_garcia');

-- MARIA SILVA NAO POSSUI PERFIL, POR ISSO NÃO FUNCIONA!
INSERT INTO PUBLICACAO (nomeDeUsuarioPerfil, titulo, conteudoEmTexto, coAutor1, coAutor2, mencoesDeUsuariosNoConteudo, usuarioAutorDaPublicacao) VALUES
('maria_silva', 'Receita de bolo de brócolis', 'Aqui está a receita de bolo de cenoura que eu prometi: ingredientes ...', 'joao123', NULL, 'joao123;pedro_garcia', 'maria_silva');

-- PEDRO_GARCIA, REFERENCIADO NAS MENÇÕES, NÃO POSSUI PERFIL, POR ISSO NÃO FUNCIONA!
INSERT INTO PUBLICACAO (nomeDeUsuarioPerfil, titulo, conteudoEmTexto, coAutor1, coAutor2, mencoesDeUsuariosNoConteudo, ehCompartilhamento, visibilidadeAtual, usuarioAutorDaPublicacao) VALUES
('joao123', 'Notícia importante', 'Pessoal, fiquem atentos: amanhã haverá uma greve dos transportes públicos na cidade. Planajem suas rotas com antecedência!', NULL, NULL, 'pedro_garcia;maria_silva', 'S', 'PUBLICO', 'pedro_garcia');

INSERT INTO PUBLICACAO (nomeDeUsuarioPerfil, titulo, conteudoEmTexto, coAutor1, coAutor2, mencoesDeUsuariosNoConteudo, ehCompartilhamento, visibilidadeAtual, usuarioAutorDaPublicacao) VALUES
('jose123', 'Notícia importante - 2', 'Pessoal, fiquem atentos: ', NULL, NULL, NULL, 'S', 'PUBLICO', 'jose123');

INSERT INTO PUBLICACAO (nomeDeUsuarioPerfil, titulo, conteudoEmTexto, coAutor1, coAutor2, mencoesDeUsuariosNoConteudo, ehCompartilhamento, visibilidadeAtual, usuarioAutorDaPublicacao) VALUES
('_thedraude', 'Notícia importante - 2', 'Pessoal, fiquem atentos: ', NULL, NULL, NULL, 'S', 'PUBLICO', 'ana22');

INSERT INTO PUBLICACAO (nomeDeUsuarioPerfil, titulo, conteudoEmTexto, coAutor1, coAutor2, mencoesDeUsuariosNoConteudo, ehCompartilhamento, visibilidadeAtual, usuarioAutorDaPublicacao) VALUES
('_thedraude', 'Notícia importante - 23', 'Pessoal, fiquem atentos: ', NULL, 'ana22', 'ana22', 'S', 'PUBLICO', '_thedraude');


DELETE FROM PERFIL 
WHERE nomeDeUsuarioDonoDoPerfil='ana22';

SELECT * FROM PUBLICACAO;


