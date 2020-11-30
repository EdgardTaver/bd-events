TRUNCATE
anuncioonline, apresentacaodeartigo, artigo, atividade, atividadesocial, avaliacao,
beneficio, canalstreaming, certificado, compostapor1, compostapor2, compostopor,
concorridopor, concurso, conselhos, contasapagar, contribui, desconta, desconto,
dirigidopor, empresa, entidade, escritopor, estacaometro, evento, grupomusical,
hotel, ingresso, instalacao, juizadopor, levaate1, levaate2, localfisico, ministradapor,
ministradopor1, ministradopor2, musica, notafiscal, ocorreem1, ocorreem2, pacote,
pagamento, palestra, palestradapor1, papel, participadapor2, participade, perfilredesocial,
pessoa, plataforma, playlist, pontodetransporte, portalvirtual, promove, publicadoem, recibo,
redesocial, registradoem1, restaurante, reuniao, taxa, taxaempresa, toca, transacao,
transfer, tutorial, universidade, veiculo, workshops
RESTART IDENTITY;

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public IS 'standard public schema';