
CREATE TABLE Evento (
    idEvento SERIAL PRIMARY KEY,
    Tema VARCHAR,
    Nome VARCHAR,
    Edicao VARCHAR,
    fk_PerfilRedeSocial_idPerfilRedeSocial SERIAL
);

CREATE TABLE Plataforma (
    idPlataforma SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Descricao VARCHAR,
    fk_Evento_idEvento SERIAL
);

CREATE TABLE LocalFisico (
    Telefone VARCHAR,
    Endereco VARCHAR,
    CapacidadeTotal INTEGER,
    fk_Plataforma_idPlataforma SERIAL PRIMARY KEY
);

CREATE TABLE PortalVirtual (
    Portal VARCHAR,
    Senha VARCHAR,
    fk_Plataforma_idPlataforma SERIAL PRIMARY KEY
);

CREATE TABLE Atividade (
    idAtividade SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Descricao VARCHAR,
    Data DATE,
    PublicoAlvo VARCHAR
);

CREATE TABLE Entidade (
    idEntidade SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Telefone VARCHAR,
    Email VARCHAR
);

CREATE TABLE Universidade (
    MEC VARCHAR,
    fk_Entidade_idEntidade SERIAL PRIMARY KEY
);

CREATE TABLE Conselhos (
    Funcao VARCHAR,
    fk_Entidade_idEntidade SERIAL PRIMARY KEY
);

CREATE TABLE Empresa (
    CNPJ INTEGER,
    RazaoSocial VARCHAR,
    fk_Entidade_idEntidade SERIAL PRIMARY KEY
);

CREATE TABLE Taxa (
    idTaxa SERIAL PRIMARY KEY,
    Valor NUMERIC,
    fk_Evento_idEvento SERIAL
);

CREATE TABLE Instalacao (
    idInstalacao SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Tipo VARCHAR,
    Capacidade INTEGER,
    fk_LocalFisico_fk_Plataforma_idPlataforma SERIAL
);

CREATE TABLE CanalStreaming (
    idStreaming SERIAL PRIMARY KEY,
    Titulo VARCHAR,
    URL VARCHAR,
    fk_PortalVirtual_fk_Plataforma_idPlataforma SERIAL
);

CREATE TABLE Ingresso (
    Numero INTEGER,
    Lote INTEGER,
    fk_Taxa_idTaxa SERIAL PRIMARY KEY
);

CREATE TABLE TaxaEmpresa (
    Descricao VARCHAR,
    Categoria VARCHAR,
    fk_Taxa_idTaxa SERIAL PRIMARY KEY,
    fk_Pacote_idPacote SERIAL
);

CREATE TABLE Pacote (
    idPacote SERIAL PRIMARY KEY,
    Tipo VARCHAR,
    Classe VARCHAR
);

CREATE TABLE Beneficio (
    idBeneficio SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Descricao VARCHAR
);

CREATE TABLE Pessoa (
    idPessoa SERIAL PRIMARY KEY,
    CPF VARCHAR UNIQUE NOT NULL,
    Nome VARCHAR,
    Telefone VARCHAR,
    Email VARCHAR
);

CREATE TABLE Desconto (
    idDesconto SERIAL PRIMARY KEY,
    Valor NUMERIC,
    Descricao VARCHAR
);

CREATE TABLE ContasAPagar (
    idContas SERIAL PRIMARY KEY,
    Valor NUMERIC,
    Descricao VARCHAR,
    fk_Atividade_idAtividade SERIAL,
    fk_Evento_idEvento SERIAL
);

CREATE TABLE Papel (
    idPapel SERIAL PRIMARY KEY,
    Funcao VARCHAR,
    Nome VARCHAR,
    Descricao VARCHAR,
    fk_Certificado_idCertificado SERIAL
);

CREATE TABLE Certificado (
    idCertificado SERIAL PRIMARY KEY,
    Descricao VARCHAR,
    Data DATE,
    CargaHoraria FLOAT
);

CREATE TABLE Tutorial (
    Tema VARCHAR,
    fk_Atividade_idAtividade SERIAL PRIMARY KEY
);

CREATE TABLE Workshops (
    Tema VARCHAR,
    fk_Atividade_idAtividade SERIAL PRIMARY KEY
);

CREATE TABLE Palestra (
    Afiliacao VARCHAR,
    NomeDaPalestra VARCHAR,
    Minicurriculo VARCHAR,
    fk_Atividade_idAtividade SERIAL PRIMARY KEY
);

CREATE TABLE AtividadeSocial (
    Tipo VARCHAR,
    Tema VARCHAR,
    fk_Atividade_idAtividade SERIAL PRIMARY KEY
);

CREATE TABLE Concurso (
    Regras VARCHAR,
    Tema VARCHAR,
    Premiacoes VARCHAR,
    fk_Atividade_idAtividade SERIAL PRIMARY KEY
);

CREATE TABLE Reuniao (
    Objetivo VARCHAR,
    fk_Atividade_idAtividade SERIAL PRIMARY KEY
);

CREATE TABLE ApresentacaoDeArtigo (
    Tema VARCHAR,
    fk_Atividade_idAtividade SERIAL PRIMARY KEY,
    fk_Artigo_idArtigo SERIAL
);

CREATE TABLE Artigo (
    idArtigo SERIAL PRIMARY KEY,
    PublicadoPor VARCHAR,
    DOI NUMERIC
);

CREATE TABLE Sessao (
    Tipo VARCHAR,
    Tema VARCHAR,
    idSessao SERIAL PRIMARY KEY
);

CREATE TABLE Playlist (
    idPlaylist SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Descricao VARCHAR,
    HoraInicio TIME
);

CREATE TABLE Musica (
    idMusica SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Ano INTEGER,
    DuracaoSegundos INTEGER,
    Plays NUMERIC,
    Genero VARCHAR,
    fk_GrupoMusical_idGrupoMusical SERIAL
);

CREATE TABLE GrupoMusical (
    idGrupoMusical SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Biografia VARCHAR,
    Origem VARCHAR
);

CREATE TABLE AnuncioOnline (
    idAnuncioOnline SERIAL PRIMARY KEY,
    Titulo VARCHAR,
    Descricao VARCHAR,
    URL VARCHAR,
    Acessos INTEGER,
    CustoPorClique NUMERIC,
    fk_Evento_idEvento SERIAL
);

CREATE TABLE PerfilRedeSocial (
    Nome VARCHAR,
    URL VARCHAR,
    idPerfilRedeSocial SERIAL PRIMARY KEY,
    Seguidores INTEGER,
    fk_GrupoMusical_idGrupoMusical SERIAL
);

CREATE TABLE RedeSocial (
    idRedeSocial SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Descricao VARCHAR,
    URL VARCHAR,
    Icone VARCHAR
);

CREATE TABLE Avaliacao (
    idAvaliacao SERIAL PRIMARY KEY,
    Nota INTEGER,
    Comentario VARCHAR,
    Data DATE,
    fk_Atividade_idAtividade SERIAL,
    fk_Evento_idEvento SERIAL,
    fk_Pessoa_idPessoa SERIAL
);

CREATE TABLE PontoDeTransporte (
    Nome VARCHAR,
    Descricao VARCHAR,
    idPontoDePartida SERIAL PRIMARY KEY,
    Endereco VARCHAR
);

CREATE TABLE Hotel (
    Estrelas INTEGER,
    Quartos INTEGER,
    fk_PontoDeTransporte_idPontoDePartida SERIAL PRIMARY KEY
);

CREATE TABLE Restaurante (
    Estrelas INTEGER,
    TipoCulinaria VARCHAR,
    fk_PontoDeTransporte_idPontoDePartida SERIAL PRIMARY KEY
);

CREATE TABLE EstacaoMetro (
    Linha VARCHAR,
    fk_PontoDeTransporte_idPontoDePartida SERIAL PRIMARY KEY
);

CREATE TABLE Transfer (
    idTransfer SERIAL PRIMARY KEY,
    HoraInicio TIME,
    HoraFim TIME,
    Intervalo FLOAT,
    fk_Veiculo_idVeiculo SERIAL
);

CREATE TABLE Veiculo (
    idVeiculo SERIAL PRIMARY KEY,
    Tipo VARCHAR,
    Descricao VARCHAR,
    Ano INTEGER
);

CREATE TABLE EventoPossuiAtividade (
    fk_Atividade_idAtividade SERIAL,
    fk_Evento_idEvento SERIAL
);

CREATE TABLE AtividadeOcorreEmInstalacao (
    fk_Instalacao_idInstalacao SERIAL,
    fk_Atividade_idAtividade SERIAL,
    HorarioInicio TIME,
    HorarioFim TIME
);

CREATE TABLE EntidadeContribuiEvento (
    fk_Entidade_idEntidade SERIAL,
    fk_Evento_idEvento SERIAL,
    Tipo VARCHAR
);

CREATE TABLE AtividadeOcorreEmStreaming (
    fk_CanalStreaming_idStreaming SERIAL,
    fk_Atividade_idAtividade SERIAL,
    HorarioInicio TIME,
    HorarioFim TIME
);

CREATE TABLE PacoteCompostoPorBeneficio (
    fk_Pacote_idPacote SERIAL,
    fk_Beneficio_idBeneficio SERIAL
);

CREATE TABLE EntidadeCompostaPorPessoa (
    fk_Pessoa_idPessoa SERIAL,
    fk_Entidade_idEntidade SERIAL
);

CREATE TABLE DescontoDescontaTaxa (
    fk_Taxa_idTaxa SERIAL,
    fk_Desconto_idDesconto SERIAL
);

CREATE TABLE PessoaExercePapel (
    fk_Papel_idPapel SERIAL,
    fk_Pessoa_idPessoa SERIAL
);

CREATE TABLE EntidadePromoveAtividade (
    fk_Entidade_idEntidade SERIAL,
    fk_Atividade_idAtividade SERIAL
);

CREATE TABLE AtividadeFinanciadaPorTaxa (
    fk_Atividade_idAtividade SERIAL,
    fk_Taxa_idTaxa SERIAL
);

CREATE TABLE TutorialMinistradoPor (
    fk_Tutorial_fk_Atividade_idAtividade SERIAL,
    fk_Papel_idPapel SERIAL
);

CREATE TABLE WorkshopMinistradoPor (
    fk_Workshops_fk_Atividade_idAtividade SERIAL,
    fk_Papel_idPapel SERIAL
);

CREATE TABLE PalestraPalestradaPor (
    fk_Palestra_fk_Atividade_idAtividade SERIAL,
    fk_Papel_idPapel SERIAL
);

CREATE TABLE AtividadeSocialParticipadaPor (
    fk_AtividadeSocial_fk_Atividade_idAtividade SERIAL,
    fk_Papel_idPapel SERIAL
);

CREATE TABLE ConcursoConcorridoPor (
    fk_Concurso_fk_Atividade_idAtividade SERIAL,
    fk_Papel_idPapel SERIAL
);

CREATE TABLE ConcursoJuizadoPor (
    fk_Concurso_fk_Atividade_idAtividade SERIAL,
    fk_Papel_idPapel SERIAL
);

CREATE TABLE ReuniaoMinistradaPor (
    fk_Reuniao_fk_Atividade_idAtividade SERIAL,
    fk_Papel_idPapel SERIAL
);

CREATE TABLE PapelParticipaDeReuniao (
    fk_Reuniao_fk_Atividade_idAtividade SERIAL,
    fk_Papel_idPapel SERIAL
);

CREATE TABLE ArtigoEscritoPor (
    fk_Papel_idPapel SERIAL,
    fk_Artigo_idArtigo SERIAL
);

CREATE TABLE ApresentacaoArtigoCompostoPor (
    fk_Sessao_idSessao SERIAL,
    fk_ApresentacaoDeArtigo_fk_Atividade_idAtividade SERIAL
);

CREATE TABLE SessaoDirigidaPor (
    fk_Sessao_idSessao SERIAL,
    fk_Papel_idPapel SERIAL
);

CREATE TABLE PlaylistCompostaPorMusica (
    fk_Playlist_idPlaylist SERIAL,
    fk_Musica_idMusica SERIAL
);

CREATE TABLE PlaylistTocaEmLocalFisico (
    fk_LocalFisico_fk_Plataforma_idPlataforma SERIAL,
    fk_Playlist_idPlaylist SERIAL
);

CREATE TABLE AnuncioPublicadoEmRedeSocial (
    fk_RedeSocial_idRedeSocial SERIAL,
    fk_AnuncioOnline_idAnuncioOnline SERIAL,
    Data TIMESTAMP
);

CREATE TABLE PerfilRegistradoEmRedeSocial (
    fk_RedeSocial_idRedeSocial SERIAL,
    fk_PerfilRedeSocial_idPerfilRedeSocial SERIAL
);

CREATE TABLE TransferLevaAtePontoDeTransporte (
    fk_PontoDeTransporte_idPontoDePartida SERIAL,
    fk_Transfer_idTransfer SERIAL
);

CREATE TABLE TransferLevaAteLocalFisico (
    fk_Transfer_idTransfer SERIAL,
    fk_LocalFisico_fk_Plataforma_idPlataforma SERIAL
);

CREATE TABLE Transacao (
    idTransacao INTEGER PRIMARY KEY,
    ValorTotal NUMERIC,
    StatusTransacao VARCHAR,
    fk_Pessoa_idPessoa SERIAL
);

CREATE TABLE NotaFiscal (
    idNotaFiscal INTEGER,
    ValorTotal NUMERIC,
    Data DATE,
    ChaveDeAcesso VARCHAR,
    fk_Transacao_idTransacao INTEGER,
    PRIMARY KEY (idNotaFiscal, fk_Transacao_idTransacao)
);

CREATE TABLE TransacaoPagoAtravesDeFormaPgmto (
    fk_Transacao_idTransacao INTEGER,
    fk_FormaDePagamento_idFormaDePagamento INTEGER
);

CREATE TABLE FormaDePagamento (
    idFormaDePagamento INTEGER PRIMARY KEY,
    Nome VARCHAR,
    Tipo VARCHAR,
    Valor NUMERIC
);

CREATE TABLE Recibo (
    idRecibo INTEGER PRIMARY KEY,
    Parcelas INTEGER,
    ValorParcela NUMERIC,
    fk_FormaDePagamento_idFormaDePagamento INTEGER
);

CREATE TABLE TransacaoIncluiTaxa (
    fk_Taxa_idTaxa SERIAL,
    fk_Transacao_idTransacao INTEGER
);

ALTER TABLE Evento ADD CONSTRAINT FK_Evento_2
    FOREIGN KEY (fk_PerfilRedeSocial_idPerfilRedeSocial)
    REFERENCES PerfilRedeSocial (idPerfilRedeSocial)
    ON DELETE CASCADE;

ALTER TABLE Plataforma ADD CONSTRAINT FK_Plataforma_2
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento)
    ON DELETE RESTRICT;

ALTER TABLE LocalFisico ADD CONSTRAINT FK_LocalFisico_2
    FOREIGN KEY (fk_Plataforma_idPlataforma)
    REFERENCES Plataforma (idPlataforma)
    ON DELETE CASCADE;

ALTER TABLE PortalVirtual ADD CONSTRAINT FK_PortalVirtual_2
    FOREIGN KEY (fk_Plataforma_idPlataforma)
    REFERENCES Plataforma (idPlataforma)
    ON DELETE CASCADE;

ALTER TABLE Universidade ADD CONSTRAINT FK_Universidade_2
    FOREIGN KEY (fk_Entidade_idEntidade)
    REFERENCES Entidade (idEntidade)
    ON DELETE CASCADE;

ALTER TABLE Conselhos ADD CONSTRAINT FK_Conselhos_2
    FOREIGN KEY (fk_Entidade_idEntidade)
    REFERENCES Entidade (idEntidade)
    ON DELETE CASCADE;

ALTER TABLE Empresa ADD CONSTRAINT FK_Empresa_2
    FOREIGN KEY (fk_Entidade_idEntidade)
    REFERENCES Entidade (idEntidade)
    ON DELETE CASCADE;

ALTER TABLE Taxa ADD CONSTRAINT FK_Taxa_2
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento)
    ON DELETE CASCADE;

ALTER TABLE Instalacao ADD CONSTRAINT FK_Instalacao_2
    FOREIGN KEY (fk_LocalFisico_fk_Plataforma_idPlataforma)
    REFERENCES LocalFisico (fk_Plataforma_idPlataforma)
    ON DELETE RESTRICT;

ALTER TABLE CanalStreaming ADD CONSTRAINT FK_CanalStreaming_2
    FOREIGN KEY (fk_PortalVirtual_fk_Plataforma_idPlataforma)
    REFERENCES PortalVirtual (fk_Plataforma_idPlataforma)
    ON DELETE CASCADE;

ALTER TABLE Ingresso ADD CONSTRAINT FK_Ingresso_2
    FOREIGN KEY (fk_Taxa_idTaxa)
    REFERENCES Taxa (idTaxa)
    ON DELETE CASCADE;

ALTER TABLE TaxaEmpresa ADD CONSTRAINT FK_TaxaEmpresa_2
    FOREIGN KEY (fk_Taxa_idTaxa)
    REFERENCES Taxa (idTaxa)
    ON DELETE CASCADE;

ALTER TABLE TaxaEmpresa ADD CONSTRAINT FK_TaxaEmpresa_3
    FOREIGN KEY (fk_Pacote_idPacote)
    REFERENCES Pacote (idPacote)
    ON DELETE RESTRICT;

ALTER TABLE ContasAPagar ADD CONSTRAINT FK_ContasAPagar_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE CASCADE;

ALTER TABLE ContasAPagar ADD CONSTRAINT FK_ContasAPagar_3
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento)
    ON DELETE CASCADE;

ALTER TABLE Papel ADD CONSTRAINT FK_Papel_2
    FOREIGN KEY (fk_Certificado_idCertificado)
    REFERENCES Certificado (idCertificado)
    ON DELETE CASCADE;

ALTER TABLE Tutorial ADD CONSTRAINT FK_Tutorial_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE CASCADE;

ALTER TABLE Workshops ADD CONSTRAINT FK_Workshops_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE CASCADE;

ALTER TABLE Palestra ADD CONSTRAINT FK_Palestra_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE CASCADE;

ALTER TABLE AtividadeSocial ADD CONSTRAINT FK_AtividadeSocial_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE CASCADE;

ALTER TABLE Concurso ADD CONSTRAINT FK_Concurso_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE CASCADE;

ALTER TABLE Reuniao ADD CONSTRAINT FK_Reuniao_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE CASCADE;

ALTER TABLE ApresentacaoDeArtigo ADD CONSTRAINT FK_ApresentacaoDeArtigo_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE CASCADE;

ALTER TABLE ApresentacaoDeArtigo ADD CONSTRAINT FK_ApresentacaoDeArtigo_3
    FOREIGN KEY (fk_Artigo_idArtigo)
    REFERENCES Artigo (idArtigo)
    ON DELETE RESTRICT;

ALTER TABLE Musica ADD CONSTRAINT FK_Musica_2
    FOREIGN KEY (fk_GrupoMusical_idGrupoMusical)
    REFERENCES GrupoMusical (idGrupoMusical)
    ON DELETE RESTRICT;

ALTER TABLE AnuncioOnline ADD CONSTRAINT FK_AnuncioOnline_2
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento)
    ON DELETE RESTRICT;

ALTER TABLE PerfilRedeSocial ADD CONSTRAINT FK_PerfilRedeSocial_2
    FOREIGN KEY (fk_GrupoMusical_idGrupoMusical)
    REFERENCES GrupoMusical (idGrupoMusical)
    ON DELETE CASCADE;

ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE SET NULL;

ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_3
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento)
    ON DELETE SET NULL;

ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_4
    FOREIGN KEY (fk_Pessoa_idPessoa)
    REFERENCES Pessoa (idPessoa)
    ON DELETE CASCADE;

ALTER TABLE Hotel ADD CONSTRAINT FK_Hotel_2
    FOREIGN KEY (fk_PontoDeTransporte_idPontoDePartida)
    REFERENCES PontoDeTransporte (idPontoDePartida)
    ON DELETE CASCADE;

ALTER TABLE Restaurante ADD CONSTRAINT FK_Restaurante_2
    FOREIGN KEY (fk_PontoDeTransporte_idPontoDePartida)
    REFERENCES PontoDeTransporte (idPontoDePartida)
    ON DELETE CASCADE;

ALTER TABLE EstacaoMetro ADD CONSTRAINT FK_EstacaoMetro_2
    FOREIGN KEY (fk_PontoDeTransporte_idPontoDePartida)
    REFERENCES PontoDeTransporte (idPontoDePartida)
    ON DELETE CASCADE;

ALTER TABLE Transfer ADD CONSTRAINT FK_Transfer_2
    FOREIGN KEY (fk_Veiculo_idVeiculo)
    REFERENCES Veiculo (idVeiculo)
    ON DELETE RESTRICT;

ALTER TABLE EventoPossuiAtividade ADD CONSTRAINT FK_Possui_1
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE EventoPossuiAtividade ADD CONSTRAINT FK_Possui_2
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento)
    ON DELETE RESTRICT;

ALTER TABLE AtividadeOcorreEmInstalacao ADD CONSTRAINT FK_OcorreEm1_1
    FOREIGN KEY (fk_Instalacao_idInstalacao)
    REFERENCES Instalacao (idInstalacao)
    ON DELETE RESTRICT;

ALTER TABLE AtividadeOcorreEmInstalacao ADD CONSTRAINT FK_OcorreEm1_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE SET NULL;

ALTER TABLE EntidadeContribuiEvento ADD CONSTRAINT FK_Contribui_1
    FOREIGN KEY (fk_Entidade_idEntidade)
    REFERENCES Entidade (idEntidade)
    ON DELETE RESTRICT;

ALTER TABLE EntidadeContribuiEvento ADD CONSTRAINT FK_Contribui_2
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento)
    ON DELETE RESTRICT;

ALTER TABLE AtividadeOcorreEmStreaming ADD CONSTRAINT FK_OcorreEm2_1
    FOREIGN KEY (fk_CanalStreaming_idStreaming)
    REFERENCES CanalStreaming (idStreaming)
    ON DELETE SET NULL;

ALTER TABLE AtividadeOcorreEmStreaming ADD CONSTRAINT FK_OcorreEm2_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE SET NULL;

ALTER TABLE PacoteCompostoPorBeneficio ADD CONSTRAINT FK_CompostoPor_1
    FOREIGN KEY (fk_Pacote_idPacote)
    REFERENCES Pacote (idPacote)
    ON DELETE RESTRICT;

ALTER TABLE PacoteCompostoPorBeneficio ADD CONSTRAINT FK_CompostoPor_2
    FOREIGN KEY (fk_Beneficio_idBeneficio)
    REFERENCES Beneficio (idBeneficio)
    ON DELETE RESTRICT;

ALTER TABLE EntidadeCompostaPorPessoa ADD CONSTRAINT FK_CompostaPor1_1
    FOREIGN KEY (fk_Pessoa_idPessoa)
    REFERENCES Pessoa (idPessoa)
    ON DELETE RESTRICT;

ALTER TABLE EntidadeCompostaPorPessoa ADD CONSTRAINT FK_CompostaPor1_2
    FOREIGN KEY (fk_Entidade_idEntidade)
    REFERENCES Entidade (idEntidade)
    ON DELETE SET NULL;

ALTER TABLE DescontoDescontaTaxa ADD CONSTRAINT FK_Desconta_1
    FOREIGN KEY (fk_Taxa_idTaxa)
    REFERENCES Taxa (idTaxa)
    ON DELETE RESTRICT;

ALTER TABLE DescontoDescontaTaxa ADD CONSTRAINT FK_Desconta_2
    FOREIGN KEY (fk_Desconto_idDesconto)
    REFERENCES Desconto (idDesconto)
    ON DELETE SET NULL;

ALTER TABLE PessoaExercePapel ADD CONSTRAINT FK_Exerce_1
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE PessoaExercePapel ADD CONSTRAINT FK_Exerce_2
    FOREIGN KEY (fk_Pessoa_idPessoa)
    REFERENCES Pessoa (idPessoa)
    ON DELETE SET NULL;

ALTER TABLE EntidadePromoveAtividade ADD CONSTRAINT FK_Promove_1
    FOREIGN KEY (fk_Entidade_idEntidade)
    REFERENCES Entidade (idEntidade)
    ON DELETE RESTRICT;

ALTER TABLE EntidadePromoveAtividade ADD CONSTRAINT FK_Promove_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE SET NULL;

ALTER TABLE AtividadeFinanciadaPorTaxa ADD CONSTRAINT FK_FinanciadoPor1_1
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE SET NULL;

ALTER TABLE AtividadeFinanciadaPorTaxa ADD CONSTRAINT FK_FinanciadoPor1_2
    FOREIGN KEY (fk_Taxa_idTaxa)
    REFERENCES Taxa (idTaxa)
    ON DELETE SET NULL;

ALTER TABLE TutorialMinistradoPor ADD CONSTRAINT FK_MinistradoPor2_1
    FOREIGN KEY (fk_Tutorial_fk_Atividade_idAtividade)
    REFERENCES Tutorial (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE TutorialMinistradoPor ADD CONSTRAINT FK_MinistradoPor2_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE WorkshopMinistradoPor ADD CONSTRAINT FK_MinistradoPor1_1
    FOREIGN KEY (fk_Workshops_fk_Atividade_idAtividade)
    REFERENCES Workshops (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE WorkshopMinistradoPor ADD CONSTRAINT FK_MinistradoPor1_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE PalestraPalestradaPor ADD CONSTRAINT FK_PalestradaPor1_1
    FOREIGN KEY (fk_Palestra_fk_Atividade_idAtividade)
    REFERENCES Palestra (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE PalestraPalestradaPor ADD CONSTRAINT FK_PalestradaPor1_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE AtividadeSocialParticipadaPor ADD CONSTRAINT FK_ParticipadaPor2_1
    FOREIGN KEY (fk_AtividadeSocial_fk_Atividade_idAtividade)
    REFERENCES AtividadeSocial (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE AtividadeSocialParticipadaPor ADD CONSTRAINT FK_ParticipadaPor2_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE ConcursoConcorridoPor ADD CONSTRAINT FK_ConcorridoPor_1
    FOREIGN KEY (fk_Concurso_fk_Atividade_idAtividade)
    REFERENCES Concurso (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE ConcursoConcorridoPor ADD CONSTRAINT FK_ConcorridoPor_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE ConcursoJuizadoPor ADD CONSTRAINT FK_JuizadoPor_1
    FOREIGN KEY (fk_Concurso_fk_Atividade_idAtividade)
    REFERENCES Concurso (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE ConcursoJuizadoPor ADD CONSTRAINT FK_JuizadoPor_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE ReuniaoMinistradaPor ADD CONSTRAINT FK_MinistradaPor_1
    FOREIGN KEY (fk_Reuniao_fk_Atividade_idAtividade)
    REFERENCES Reuniao (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE ReuniaoMinistradaPor ADD CONSTRAINT FK_MinistradaPor_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE PapelParticipaDeReuniao ADD CONSTRAINT FK_ParticipaDe_1
    FOREIGN KEY (fk_Reuniao_fk_Atividade_idAtividade)
    REFERENCES Reuniao (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE PapelParticipaDeReuniao ADD CONSTRAINT FK_ParticipaDe_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE ArtigoEscritoPor ADD CONSTRAINT FK_EscritoPor_1
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE ArtigoEscritoPor ADD CONSTRAINT FK_EscritoPor_2
    FOREIGN KEY (fk_Artigo_idArtigo)
    REFERENCES Artigo (idArtigo)
    ON DELETE RESTRICT;

ALTER TABLE ApresentacaoArtigoCompostoPor ADD CONSTRAINT FK_CompostoPor2_1
    FOREIGN KEY (fk_Sessao_idSessao)
    REFERENCES Sessao (idSessao)
    ON DELETE RESTRICT;

ALTER TABLE ApresentacaoArtigoCompostoPor ADD CONSTRAINT FK_CompostoPor2_2
    FOREIGN KEY (fk_ApresentacaoDeArtigo_fk_Atividade_idAtividade)
    REFERENCES ApresentacaoDeArtigo (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;

ALTER TABLE SessaoDirigidaPor ADD CONSTRAINT FK_DirigidoPor_1
    FOREIGN KEY (fk_Sessao_idSessao)
    REFERENCES Sessao (idSessao)
    ON DELETE RESTRICT;

ALTER TABLE SessaoDirigidaPor ADD CONSTRAINT FK_DirigidoPor_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;

ALTER TABLE PlaylistCompostaPorMusica ADD CONSTRAINT FK_CompostaPor2_1
    FOREIGN KEY (fk_Playlist_idPlaylist)
    REFERENCES Playlist (idPlaylist)
    ON DELETE RESTRICT;

ALTER TABLE PlaylistCompostaPorMusica ADD CONSTRAINT FK_CompostaPor2_2
    FOREIGN KEY (fk_Musica_idMusica)
    REFERENCES Musica (idMusica)
    ON DELETE RESTRICT;

ALTER TABLE PlaylistTocaEmLocalFisico ADD CONSTRAINT FK_Toca_1
    FOREIGN KEY (fk_LocalFisico_fk_Plataforma_idPlataforma)
    REFERENCES LocalFisico (fk_Plataforma_idPlataforma)
    ON DELETE RESTRICT;

ALTER TABLE PlaylistTocaEmLocalFisico ADD CONSTRAINT FK_Toca_2
    FOREIGN KEY (fk_Playlist_idPlaylist)
    REFERENCES Playlist (idPlaylist)
    ON DELETE RESTRICT;

ALTER TABLE AnuncioPublicadoEmRedeSocial ADD CONSTRAINT FK_PublicadoEm_1
    FOREIGN KEY (fk_RedeSocial_idRedeSocial)
    REFERENCES RedeSocial (idRedeSocial)
    ON DELETE RESTRICT;

ALTER TABLE AnuncioPublicadoEmRedeSocial ADD CONSTRAINT FK_PublicadoEm_2
    FOREIGN KEY (fk_AnuncioOnline_idAnuncioOnline)
    REFERENCES AnuncioOnline (idAnuncioOnline)
    ON DELETE SET NULL;

ALTER TABLE PerfilRegistradoEmRedeSocial ADD CONSTRAINT FK_RegistradoEm1_1
    FOREIGN KEY (fk_RedeSocial_idRedeSocial)
    REFERENCES RedeSocial (idRedeSocial)
    ON DELETE RESTRICT;

ALTER TABLE PerfilRegistradoEmRedeSocial ADD CONSTRAINT FK_RegistradoEm1_2
    FOREIGN KEY (fk_PerfilRedeSocial_idPerfilRedeSocial)
    REFERENCES PerfilRedeSocial (idPerfilRedeSocial)
    ON DELETE SET NULL;

ALTER TABLE TransferLevaAtePontoDeTransporte ADD CONSTRAINT FK_LevaAte1_1
    FOREIGN KEY (fk_PontoDeTransporte_idPontoDePartida)
    REFERENCES PontoDeTransporte (idPontoDePartida)
    ON DELETE RESTRICT;

ALTER TABLE TransferLevaAtePontoDeTransporte ADD CONSTRAINT FK_LevaAte1_2
    FOREIGN KEY (fk_Transfer_idTransfer)
    REFERENCES Transfer (idTransfer)
    ON DELETE RESTRICT;

ALTER TABLE TransferLevaAteLocalFisico ADD CONSTRAINT FK_LevaAte2_1
    FOREIGN KEY (fk_Transfer_idTransfer)
    REFERENCES Transfer (idTransfer)
    ON DELETE RESTRICT;

ALTER TABLE TransferLevaAteLocalFisico ADD CONSTRAINT FK_LevaAte2_2
    FOREIGN KEY (fk_LocalFisico_fk_Plataforma_idPlataforma)
    REFERENCES LocalFisico (fk_Plataforma_idPlataforma)
    ON DELETE RESTRICT;

ALTER TABLE Transacao ADD CONSTRAINT FK_Transacao_2
    FOREIGN KEY (fk_Pessoa_idPessoa)
    REFERENCES Pessoa (idPessoa)
    ON DELETE CASCADE;

ALTER TABLE NotaFiscal ADD CONSTRAINT FK_NotaFiscal_2
    FOREIGN KEY (fk_Transacao_idTransacao)
    REFERENCES Transacao (idTransacao);

ALTER TABLE TransacaoPagoAtravesDeFormaPgmto ADD CONSTRAINT FK_TransacaoPagoAtravesDeFormaPgmto_1
    FOREIGN KEY (fk_Transacao_idTransacao)
    REFERENCES Transacao (idTransacao)
    ON DELETE RESTRICT;

ALTER TABLE TransacaoPagoAtravesDeFormaPgmto ADD CONSTRAINT FK_TransacaoPagoAtravesDeFormaPgmto_2
    FOREIGN KEY (fk_FormaDePagamento_idFormaDePagamento)
    REFERENCES FormaDePagamento (idFormaDePagamento)
    ON DELETE RESTRICT;

ALTER TABLE Recibo ADD CONSTRAINT FK_Recibo_2
    FOREIGN KEY (fk_FormaDePagamento_idFormaDePagamento)
    REFERENCES FormaDePagamento (idFormaDePagamento)
    ON DELETE RESTRICT;

ALTER TABLE TransacaoIncluiTaxa ADD CONSTRAINT FK_TransacaoIncluiTaxa_1
    FOREIGN KEY (fk_Taxa_idTaxa)
    REFERENCES Taxa (idTaxa)
    ON DELETE RESTRICT;

ALTER TABLE TransacaoIncluiTaxa ADD CONSTRAINT FK_TransacaoIncluiTaxa_2
    FOREIGN KEY (fk_Transacao_idTransacao)
    REFERENCES Transacao (idTransacao);