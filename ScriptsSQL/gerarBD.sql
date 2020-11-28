/* LogicoGeradorSQL: */

CREATE TABLE Evento (
    idEvento SERIAL PRIMARY KEY,
    Tema VARCHAR,
    Nome VARCHAR,
    Edicao VARCHAR
);

CREATE TABLE Plataforma (
    idPlataforma SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Descricao VARCHAR,
    fk_Evento_idEvento INTEGER
);

CREATE TABLE LocalFisico (
    Telefone VARCHAR,
    Endereco VARCHAR,
    CapacidadeTotal INTEGER,
    fk_Plataforma_idPlataforma INTEGER PRIMARY KEY
);

CREATE TABLE PortalVirtual (
    Portal VARCHAR,
    Senha VARCHAR,
    fk_Plataforma_idPlataforma INTEGER PRIMARY KEY
);

CREATE TABLE Atividade (
    idAtividade SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Descricao VARCHAR,
    Data DATE,
    PublicoAlvo VARCHAR,
    fk_Evento_idEvento INTEGER
);

CREATE TABLE Entidade (
    idEntidade SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Telefone VARCHAR,
    Email VARCHAR
);

CREATE TABLE Universidade (
    MEC VARCHAR,
    fk_Entidade_idEntidade INTEGER PRIMARY KEY,
    RazaoSocial VARCHAR
);

CREATE TABLE Conselhos (
    Funcao VARCHAR,
    fk_Entidade_idEntidade INTEGER PRIMARY KEY
);

CREATE TABLE Empresa (
    CNPJ VARCHAR,
    RazaoSocial VARCHAR,
    fk_Entidade_idEntidade INTEGER PRIMARY KEY
);

CREATE TABLE Taxa (
    idTaxa SERIAL PRIMARY KEY,
    Valor NUMERIC,
    fk_Evento_idEvento INTEGER,
    fk_Transacao_idTransacao INTEGER
);

CREATE TABLE Instalacao (
    idInstalacao SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Tipo VARCHAR,
    Capacidade INTEGER,
    fk_LocalFisico_fk_Plataforma_idPlataforma INTEGER
);

CREATE TABLE CanalStreaming (
    idStreaming SERIAL PRIMARY KEY,
    Titulo VARCHAR,
    URL VARCHAR,
    fk_PortalVirtual_fk_Plataforma_idPlataforma INTEGER
);

CREATE TABLE Ingresso (
    Numero INTEGER,
    Lote INTEGER,
    fk_Taxa_idTaxa INTEGER PRIMARY KEY
);

CREATE TABLE TaxaEmpresa (
    Descricao VARCHAR,
    Categoria VARCHAR,
    fk_Taxa_idTaxa INTEGER PRIMARY KEY,
    fk_Pacote_idPacote INTEGER
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
    CPF VARCHAR,
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
    fk_Atividade_idAtividade INTEGER,
    fk_Evento_idEvento INTEGER
);

CREATE TABLE Papel (
    idPapel SERIAL PRIMARY KEY,
    Funcao VARCHAR,
    Descricao VARCHAR,
    fk_Certificado_idCertificado INTEGER,
    fk_Pessoa_idPessoa INTEGER
);

CREATE TABLE Certificado (
    idCertificado SERIAL PRIMARY KEY,
    Descricao VARCHAR,
    Data DATE,
    CargaHoraria FLOAT
);

CREATE TABLE Tutorial (
    Tema VARCHAR,
    fk_Atividade_idAtividade INTEGER PRIMARY KEY
);

CREATE TABLE Workshops (
    Tema VARCHAR,
    fk_Atividade_idAtividade INTEGER PRIMARY KEY
);

CREATE TABLE Palestra (
    Afiliacao VARCHAR,
    NomeDaPalestra VARCHAR,
    Minicurriculo VARCHAR,
    fk_Atividade_idAtividade INTEGER PRIMARY KEY
);

CREATE TABLE AtividadeSocial (
    Tipo VARCHAR,
    Tema VARCHAR,
    fk_Atividade_idAtividade INTEGER PRIMARY KEY
);

CREATE TABLE Concurso (
    Regras VARCHAR,
    Tema VARCHAR,
    Premiacoes VARCHAR,
    fk_Atividade_idAtividade INTEGER PRIMARY KEY
);

CREATE TABLE Reuniao (
    Objetivo VARCHAR,
    fk_Atividade_idAtividade INTEGER PRIMARY KEY
);

CREATE TABLE ApresentacaoDeArtigo (
    Tema VARCHAR,
    fk_Atividade_idAtividade INTEGER PRIMARY KEY,
    fk_Artigo_idArtigo INTEGER
);

CREATE TABLE Artigo (
    idArtigo SERIAL PRIMARY KEY,
    PublicadoPor VARCHAR,
    DOI NUMERIC,
    Titulo VARCHAR,
    Abstract VARCHAR,
    Keywords VARCHAR
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
    fk_GrupoMusical_idGrupoMusical INTEGER
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
    fk_Evento_idEvento INTEGER
);

CREATE TABLE PerfilRedeSocial (
    Nome VARCHAR,
    URL VARCHAR,
    idPerfilRedeSocial SERIAL PRIMARY KEY,
    Seguidores INTEGER,
    fk_GrupoMusical_idGrupoMusical INTEGER,
    fk_Evento_idEvento INTEGER
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
    fk_Atividade_idAtividade INTEGER,
    fk_Evento_idEvento INTEGER,
    fk_Pessoa_idPessoa INTEGER
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
    fk_PontoDeTransporte_idPontoDePartida INTEGER PRIMARY KEY
);

CREATE TABLE Restaurante (
    Estrelas INTEGER,
    TipoCulinaria VARCHAR,
    fk_PontoDeTransporte_idPontoDePartida INTEGER PRIMARY KEY
);

CREATE TABLE EstacaoMetro (
    Linha VARCHAR,
    fk_PontoDeTransporte_idPontoDePartida INTEGER PRIMARY KEY
);

CREATE TABLE Transfer (
    idTransfer SERIAL PRIMARY KEY,
    HoraInicio TIME,
    HoraFim TIME,
    Intervalo TIME,
    fk_Veiculo_idVeiculo INTEGER
);

CREATE TABLE Veiculo (
    idVeiculo SERIAL PRIMARY KEY,
    Marca VARCHAR,
    Modelo VARCHAR,
    Ano INTEGER
);

CREATE TABLE OcorreEm1 (
    fk_Instalacao_idInstalacao INTEGER,
    fk_Atividade_idAtividade INTEGER,
    HorarioInicio TIME,
    HorarioFim TIME
);

CREATE TABLE Contribui (
    fk_Entidade_idEntidade INTEGER,
    fk_Evento_idEvento INTEGER,
    Tipo VARCHAR
);

CREATE TABLE OcorreEm2 (
    fk_CanalStreaming_idStreaming INTEGER,
    fk_Atividade_idAtividade INTEGER,
    HorarioInicio TIME,
    HorarioFim TIME
);

CREATE TABLE CompostoPor (
    fk_Pacote_idPacote INTEGER,
    fk_Beneficio_idBeneficio INTEGER
);

CREATE TABLE CompostaPor1 (
    fk_Pessoa_idPessoa INTEGER,
    fk_Entidade_idEntidade INTEGER
);

CREATE TABLE Desconta (
    fk_Taxa_idTaxa INTEGER,
    fk_Desconto_idDesconto INTEGER
);

CREATE TABLE Promove (
    fk_Entidade_idEntidade INTEGER,
    fk_Atividade_idAtividade INTEGER
);

CREATE TABLE FinanciadoPor1 (
    fk_Atividade_idAtividade INTEGER,
    fk_Taxa_idTaxa INTEGER
);

CREATE TABLE MinistradoPor2 (
    fk_Tutorial_fk_Atividade_idAtividade INTEGER,
    fk_Papel_idPapel INTEGER
);

CREATE TABLE MinistradoPor1 (
    fk_Workshops_fk_Atividade_idAtividade INTEGER,
    fk_Papel_idPapel INTEGER
);

CREATE TABLE PalestradaPor1 (
    fk_Palestra_fk_Atividade_idAtividade INTEGER,
    fk_Papel_idPapel INTEGER
);

CREATE TABLE ParticipadaPor2 (
    fk_AtividadeSocial_fk_Atividade_idAtividade INTEGER,
    fk_Papel_idPapel INTEGER
);

CREATE TABLE ConcorridoPor (
    fk_Concurso_fk_Atividade_idAtividade INTEGER,
    fk_Papel_idPapel INTEGER
);

CREATE TABLE JuizadoPor (
    fk_Concurso_fk_Atividade_idAtividade INTEGER,
    fk_Papel_idPapel INTEGER
);

CREATE TABLE MinistradaPor (
    fk_Reuniao_fk_Atividade_idAtividade INTEGER,
    fk_Papel_idPapel INTEGER
);

CREATE TABLE ParticipaDe (
    fk_Reuniao_fk_Atividade_idAtividade INTEGER,
    fk_Papel_idPapel INTEGER
);

CREATE TABLE EscritoPor (
    fk_Papel_idPapel INTEGER,
    fk_Artigo_idArtigo INTEGER
);

CREATE TABLE DirigidoPor (
    fk_ApresentacaoDeArtigo_idApresentacaoDeArtigo INTEGER,
    fk_Papel_idPapel INTEGER
);

CREATE TABLE CompostaPor2 (
    fk_Playlist_idPlaylist INTEGER,
    fk_Musica_idMusica INTEGER
);

CREATE TABLE Toca (
    fk_LocalFisico_fk_Plataforma_idPlataforma INTEGER,
    fk_Playlist_idPlaylist INTEGER
);

CREATE TABLE PublicadoEm (
    fk_RedeSocial_idRedeSocial INTEGER,
    fk_AnuncioOnline_idAnuncioOnline INTEGER,
    Data TIMESTAMP
);

CREATE TABLE RegistradoEm1 (
    fk_RedeSocial_idRedeSocial INTEGER,
    fk_PerfilRedeSocial_idPerfilRedeSocial INTEGER
);

CREATE TABLE LevaAte1 (
    fk_PontoDeTransporte_idPontoDePartida INTEGER,
    fk_Transfer_idTransfer INTEGER
);

CREATE TABLE LevaAte2 (
    fk_Transfer_idTransfer INTEGER,
    fk_LocalFisico_fk_Plataforma_idPlataforma INTEGER
);

CREATE TABLE Transacao (
    idTransacao SERIAL PRIMARY KEY,
    ValorTotal NUMERIC,
    StatusTransacao VARCHAR,
    fk_Pessoa_idPessoa INTEGER
);

CREATE TABLE NotaFiscal (
    idNotaFiscal SERIAL PRIMARY KEY,
    ValorTotal NUMERIC,
    Data DATE,
    ChaveDeAcesso VARCHAR,
    fk_Transacao_idTransacao INTEGER,
    Itens VARCHAR,
    CFOP VARCHAR,
    Numero NUMERIC,
    ValorImposto NUMERIC
);

CREATE TABLE Pagamento (
    idPagamento SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Tipo VARCHAR,
    Valor NUMERIC,
    fk_Transacao_idTransacao INTEGER,
    CodigoAdquirente VARCHAR,
    Status VARCHAR
);

CREATE TABLE Recibo (
    idRecibo SERIAL PRIMARY KEY,
    Parcelas INTEGER,
    ValorParcela NUMERIC,
    fk_Pagamento_idPagamento INTEGER,
    Adquirente VARCHAR,
    CodigoAdquirente VARCHAR,
    Descricao VARCHAR
);
 
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
 
ALTER TABLE Atividade ADD CONSTRAINT FK_Atividade_2
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento);
 
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
 
ALTER TABLE Taxa ADD CONSTRAINT FK_Taxa_3
    FOREIGN KEY (fk_Transacao_idTransacao)
    REFERENCES Transacao (idTransacao);
 
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
 
ALTER TABLE Papel ADD CONSTRAINT FK_Papel_3
    FOREIGN KEY (fk_Pessoa_idPessoa)
    REFERENCES Pessoa (idPessoa);
 
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
 
ALTER TABLE PerfilRedeSocial ADD CONSTRAINT FK_PerfilRedeSocial_3
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento);
 
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
 
ALTER TABLE OcorreEm1 ADD CONSTRAINT FK_OcorreEm1_1
    FOREIGN KEY (fk_Instalacao_idInstalacao)
    REFERENCES Instalacao (idInstalacao)
    ON DELETE RESTRICT;
 
ALTER TABLE OcorreEm1 ADD CONSTRAINT FK_OcorreEm1_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE SET NULL;
 
ALTER TABLE Contribui ADD CONSTRAINT FK_Contribui_1
    FOREIGN KEY (fk_Entidade_idEntidade)
    REFERENCES Entidade (idEntidade)
    ON DELETE RESTRICT;
 
ALTER TABLE Contribui ADD CONSTRAINT FK_Contribui_2
    FOREIGN KEY (fk_Evento_idEvento)
    REFERENCES Evento (idEvento)
    ON DELETE RESTRICT;
 
ALTER TABLE OcorreEm2 ADD CONSTRAINT FK_OcorreEm2_1
    FOREIGN KEY (fk_CanalStreaming_idStreaming)
    REFERENCES CanalStreaming (idStreaming)
    ON DELETE SET NULL;
 
ALTER TABLE OcorreEm2 ADD CONSTRAINT FK_OcorreEm2_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE SET NULL;
 
ALTER TABLE CompostoPor ADD CONSTRAINT FK_CompostoPor_1
    FOREIGN KEY (fk_Pacote_idPacote)
    REFERENCES Pacote (idPacote)
    ON DELETE RESTRICT;
 
ALTER TABLE CompostoPor ADD CONSTRAINT FK_CompostoPor_2
    FOREIGN KEY (fk_Beneficio_idBeneficio)
    REFERENCES Beneficio (idBeneficio)
    ON DELETE RESTRICT;
 
ALTER TABLE CompostaPor1 ADD CONSTRAINT FK_CompostaPor1_1
    FOREIGN KEY (fk_Pessoa_idPessoa)
    REFERENCES Pessoa (idPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE CompostaPor1 ADD CONSTRAINT FK_CompostaPor1_2
    FOREIGN KEY (fk_Entidade_idEntidade)
    REFERENCES Entidade (idEntidade)
    ON DELETE SET NULL;
 
ALTER TABLE Desconta ADD CONSTRAINT FK_Desconta_1
    FOREIGN KEY (fk_Taxa_idTaxa)
    REFERENCES Taxa (idTaxa)
    ON DELETE RESTRICT;
 
ALTER TABLE Desconta ADD CONSTRAINT FK_Desconta_2
    FOREIGN KEY (fk_Desconto_idDesconto)
    REFERENCES Desconto (idDesconto)
    ON DELETE SET NULL;
 
ALTER TABLE Promove ADD CONSTRAINT FK_Promove_1
    FOREIGN KEY (fk_Entidade_idEntidade)
    REFERENCES Entidade (idEntidade)
    ON DELETE RESTRICT;
 
ALTER TABLE Promove ADD CONSTRAINT FK_Promove_2
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE SET NULL;
 
ALTER TABLE FinanciadoPor1 ADD CONSTRAINT FK_FinanciadoPor1_1
    FOREIGN KEY (fk_Atividade_idAtividade)
    REFERENCES Atividade (idAtividade)
    ON DELETE SET NULL;
 
ALTER TABLE FinanciadoPor1 ADD CONSTRAINT FK_FinanciadoPor1_2
    FOREIGN KEY (fk_Taxa_idTaxa)
    REFERENCES Taxa (idTaxa)
    ON DELETE SET NULL;
 
ALTER TABLE MinistradoPor2 ADD CONSTRAINT FK_MinistradoPor2_1
    FOREIGN KEY (fk_Tutorial_fk_Atividade_idAtividade)
    REFERENCES Tutorial (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;
 
ALTER TABLE MinistradoPor2 ADD CONSTRAINT FK_MinistradoPor2_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE MinistradoPor1 ADD CONSTRAINT FK_MinistradoPor1_1
    FOREIGN KEY (fk_Workshops_fk_Atividade_idAtividade)
    REFERENCES Workshops (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;
 
ALTER TABLE MinistradoPor1 ADD CONSTRAINT FK_MinistradoPor1_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE PalestradaPor1 ADD CONSTRAINT FK_PalestradaPor1_1
    FOREIGN KEY (fk_Palestra_fk_Atividade_idAtividade)
    REFERENCES Palestra (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;
 
ALTER TABLE PalestradaPor1 ADD CONSTRAINT FK_PalestradaPor1_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE ParticipadaPor2 ADD CONSTRAINT FK_ParticipadaPor2_1
    FOREIGN KEY (fk_AtividadeSocial_fk_Atividade_idAtividade)
    REFERENCES AtividadeSocial (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;
 
ALTER TABLE ParticipadaPor2 ADD CONSTRAINT FK_ParticipadaPor2_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE ConcorridoPor ADD CONSTRAINT FK_ConcorridoPor_1
    FOREIGN KEY (fk_Concurso_fk_Atividade_idAtividade)
    REFERENCES Concurso (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;
 
ALTER TABLE ConcorridoPor ADD CONSTRAINT FK_ConcorridoPor_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE JuizadoPor ADD CONSTRAINT FK_JuizadoPor_1
    FOREIGN KEY (fk_Concurso_fk_Atividade_idAtividade)
    REFERENCES Concurso (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;
 
ALTER TABLE JuizadoPor ADD CONSTRAINT FK_JuizadoPor_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE MinistradaPor ADD CONSTRAINT FK_MinistradaPor_1
    FOREIGN KEY (fk_Reuniao_fk_Atividade_idAtividade)
    REFERENCES Reuniao (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;
 
ALTER TABLE MinistradaPor ADD CONSTRAINT FK_MinistradaPor_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE ParticipaDe ADD CONSTRAINT FK_ParticipaDe_1
    FOREIGN KEY (fk_Reuniao_fk_Atividade_idAtividade)
    REFERENCES Reuniao (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;
 
ALTER TABLE ParticipaDe ADD CONSTRAINT FK_ParticipaDe_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE EscritoPor ADD CONSTRAINT FK_EscritoPor_1
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE EscritoPor ADD CONSTRAINT FK_EscritoPor_2
    FOREIGN KEY (fk_Artigo_idArtigo)
    REFERENCES Artigo (idArtigo)
    ON DELETE RESTRICT;
 
ALTER TABLE DirigidoPor ADD CONSTRAINT FK_DirigidoPor_1
    FOREIGN KEY (fk_ApresentacaoDeArtigo_idApresentacaoDeArtigo)
    REFERENCES ApresentacaoDeArtigo (fk_Atividade_idAtividade)
    ON DELETE RESTRICT;
 
ALTER TABLE DirigidoPor ADD CONSTRAINT FK_DirigidoPor_2
    FOREIGN KEY (fk_Papel_idPapel)
    REFERENCES Papel (idPapel)
    ON DELETE RESTRICT;
 
ALTER TABLE CompostaPor2 ADD CONSTRAINT FK_CompostaPor2_1
    FOREIGN KEY (fk_Playlist_idPlaylist)
    REFERENCES Playlist (idPlaylist)
    ON DELETE RESTRICT;
 
ALTER TABLE CompostaPor2 ADD CONSTRAINT FK_CompostaPor2_2
    FOREIGN KEY (fk_Musica_idMusica)
    REFERENCES Musica (idMusica)
    ON DELETE RESTRICT;
 
ALTER TABLE Toca ADD CONSTRAINT FK_Toca_1
    FOREIGN KEY (fk_LocalFisico_fk_Plataforma_idPlataforma)
    REFERENCES LocalFisico (fk_Plataforma_idPlataforma)
    ON DELETE RESTRICT;
 
ALTER TABLE Toca ADD CONSTRAINT FK_Toca_2
    FOREIGN KEY (fk_Playlist_idPlaylist)
    REFERENCES Playlist (idPlaylist)
    ON DELETE RESTRICT;
 
ALTER TABLE PublicadoEm ADD CONSTRAINT FK_PublicadoEm_1
    FOREIGN KEY (fk_RedeSocial_idRedeSocial)
    REFERENCES RedeSocial (idRedeSocial)
    ON DELETE RESTRICT;
 
ALTER TABLE PublicadoEm ADD CONSTRAINT FK_PublicadoEm_2
    FOREIGN KEY (fk_AnuncioOnline_idAnuncioOnline)
    REFERENCES AnuncioOnline (idAnuncioOnline)
    ON DELETE SET NULL;
 
ALTER TABLE RegistradoEm1 ADD CONSTRAINT FK_RegistradoEm1_1
    FOREIGN KEY (fk_RedeSocial_idRedeSocial)
    REFERENCES RedeSocial (idRedeSocial)
    ON DELETE RESTRICT;
 
ALTER TABLE RegistradoEm1 ADD CONSTRAINT FK_RegistradoEm1_2
    FOREIGN KEY (fk_PerfilRedeSocial_idPerfilRedeSocial)
    REFERENCES PerfilRedeSocial (idPerfilRedeSocial)
    ON DELETE SET NULL;
 
ALTER TABLE LevaAte1 ADD CONSTRAINT FK_LevaAte1_1
    FOREIGN KEY (fk_PontoDeTransporte_idPontoDePartida)
    REFERENCES PontoDeTransporte (idPontoDePartida)
    ON DELETE RESTRICT;
 
ALTER TABLE LevaAte1 ADD CONSTRAINT FK_LevaAte1_2
    FOREIGN KEY (fk_Transfer_idTransfer)
    REFERENCES Transfer (idTransfer)
    ON DELETE RESTRICT;
 
ALTER TABLE LevaAte2 ADD CONSTRAINT FK_LevaAte2_1
    FOREIGN KEY (fk_Transfer_idTransfer)
    REFERENCES Transfer (idTransfer)
    ON DELETE RESTRICT;
 
ALTER TABLE LevaAte2 ADD CONSTRAINT FK_LevaAte2_2
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
 
ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento_2
    FOREIGN KEY (fk_Transacao_idTransacao)
    REFERENCES Transacao (idTransacao);
 
ALTER TABLE Recibo ADD CONSTRAINT FK_Recibo_2
    FOREIGN KEY (fk_Pagamento_idPagamento)
    REFERENCES Pagamento (idPagamento)
    ON DELETE RESTRICT;