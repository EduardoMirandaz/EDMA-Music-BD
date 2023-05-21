CREATE TABLE USUARIO (
	nomeDeUsuario VARCHAR(30),
	email VARCHAR(60) NOT NULL,
	senha VARCHAR(60) NOT NULL,
	ultimasSenhas VARCHAR(183) NOT NULL,
	dataHoraCriacao TIMESTAMP NOT NULL DEFAULT now(),

	CONSTRAINT PK_USUARIO PRIMARY KEY(nomeDeUsuario),
	
	CONSTRAINT UNQ_EMAIL UNIQUE (email),

	CONSTRAINT CK_NOMEDEUSUARIO
    	CHECK (REGEXP_LIKE(nomeDeUsuario, '^[^0-9][A-Za-z_\-\$\d]*$')),
    CONSTRAINT CK_EMAIL
    	CHECK (REGEXP_LIKE(email, '[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'))
	
);

INSERT INTO USUARIO (nomeDeUsuario, email, senha, ultimasSenhas, dataHoraCriacao)
VALUES ('autor_deletado', 'autordeletado@deletado.com', 'senha123', 'senha123', DEFAULT);

CREATE TABLE PERFIL (
	nomeDeUsuarioDonoDoPerfil VARCHAR(30),
	nomeDoPerfil VARCHAR(100),
	urlFotoDePerfil VARCHAR(400),
    quantidadeDeSeguidores INT NOT NULL DEFAULT 0,
    quantidadeTotalLikesEmPublicacoes INT NOT NULL DEFAULT 0,
	dataHoraUltimaModificacao TIMESTAMP NOT NULL DEFAULT now(),

	CONSTRAINT PK_PERFIL PRIMARY KEY(nomeDeUsuarioDonoDoPerfil),
	
	CONSTRAINT FK_USUARIO_PERFIL
		FOREIGN KEY(nomeDeUsuarioDonoDoPerfil)
		REFERENCES USUARIO(nomeDeUsuario) ON DELETE CASCADE,
    	
	CONSTRAINT CK_NOME_DO_PERFIL
    	CHECK (REGEXP_LIKE(nomeDoPerfil, '^[A-Za-zà-úÀ-Ú]+(\s[A-Za-zà-úÀ-Ú]+)*$'))
);

INSERT INTO PERFIL (nomeDeUsuarioDonoDoPerfil, nomeDoPerfil, urlFotoDePerfil, quantidadeDeSeguidores, quantidadeTotalLikesEmPublicacoes, dataHoraUltimaModificacao)
VALUES ('autor_deletado', 'Autor deletado', 0, 0, 0, DEFAULT);

CREATE TABLE PUBLICACAO (
	nomeDeUsuarioPerfil VARCHAR(30),
	titulo VARCHAR(40),
	conteudoEmTexto VARCHAR(2500),
    coAutor1 VARCHAR(30),
    coAutor2 VARCHAR(30),
    quantidadeLikes INT NOT NULL DEFAULT 0,
	quantidadeCompartilhamentos INT NOT NULL DEFAULT 0,
	mencoesDeUsuariosNoConteudo VARCHAR(300),
	ehCompartilhamento CHAR(1) NOT NULL DEFAULT 'N',
    visibilidadeAtual VARCHAR(20) NOT NULL DEFAULT 'PUBLICO',
    usuarioAutorDaPublicacao VARCHAR(30),
    
	dataHoraCriacao TIMESTAMP NOT NULL DEFAULT now(),
	dataHoraUltimaModificacao TIMESTAMP NOT NULL DEFAULT now(),

	CONSTRAINT PK_PUBLICACAO PRIMARY KEY(nomeDeUsuarioPerfil, titulo),
	
	CONSTRAINT FK_USUARIOPERFIL_PUBLICACAO
		FOREIGN KEY(nomeDeUsuarioPerfil)
		REFERENCES PERFIL(nomeDeUsuarioDonoDoPerfil) ON DELETE CASCADE,

	CONSTRAINT FK_COAUTOR_1_PUBLICACAO
		FOREIGN KEY(coAutor1)
		REFERENCES PERFIL(nomeDeUsuarioDonoDoPerfil), -- ON DELETE ESTÁ SETADO POR TRIGGER

	CONSTRAINT FK_COAUTOR_2_PUBLICACAO
		FOREIGN KEY(coAutor2)
		REFERENCES PERFIL(nomeDeUsuarioDonoDoPerfil), -- ON DELETE ESTÁ SETADO POR TRIGGER

	CONSTRAINT FK_USUARIO_AUTOR_PUBLICACAO
		FOREIGN KEY(usuarioAutorDaPublicacao)
		REFERENCES PERFIL(nomeDeUsuarioDonoDoPerfil), -- ON DELETE ESTÁ SETADO POR TRIGGER
		
	
    CONSTRAINT CK_TITULO_PUBLICACAO
    	CHECK (REGEXP_LIKE(titulo, '^([a-zA-Zà-úÀ-Ú0-9]|-|_|\s)+$')),
    	
	CONSTRAINT CK_MENCOES_DE_USUARIOS_NO_CONTEUDO_PUBLICACAO
    	CHECK (REGEXP_LIKE(mencoesDeUsuariosNoConteudo, '^[A-Za-z][A-Za-z_\-\$\d]*?(;[A-Za-z_][A-Za-z_\-\$\d]*)*$')),
    	
	CONSTRAINT CK_EHCOMPARTILHAMENTO_BOOLEAN
    	CHECK (ehCompartilhamento IN ('S', 'N')),
    
	CONSTRAINT CK_VISIBILIDADE_ATUAL_PUBLICACAO
    	CHECK (visibilidadeAtual IN ('PUBLICO', 'PRIVADO', 'APENAS_SEGUIDORES'))
    
);

CREATE OR REPLACE FUNCTION deletar_perfis_na_tabela_publicacao()
RETURNS TRIGGER AS $$
BEGIN
    -- Atualiza as publicações em que o perfil a ser deletado é o autor
    UPDATE publicacao SET usuarioAutorDaPublicacao = 'autor_deletado' WHERE usuarioAutorDaPublicacao = OLD.nomeDeUsuarioDonoDoPerfil;
    
    -- Atualiza as publicações em que o perfil a ser deletado é coautor 1
    UPDATE publicacao SET coAutor1 = 'autor_deletado' WHERE coAutor1 = OLD.nomeDeUsuarioDonoDoPerfil;
    
    -- Atualiza as publicações em que o perfil a ser deletado é coautor 2
    UPDATE publicacao SET coAutor2 = 'autor_deletado' WHERE coAutor2 = OLD.nomeDeUsuarioDonoDoPerfil;

    -- Retorna o trigger
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Cria o trigger na tabela perfil
CREATE TRIGGER atualizar_publicacoes_ao_deletar_perfil
BEFORE DELETE ON PERFIL
FOR EACH ROW
EXECUTE FUNCTION deletar_perfis_na_tabela_publicacao();




