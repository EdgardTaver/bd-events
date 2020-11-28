TRUNCATE
evento,plataforma,localfisico,portalvirtual,atividade,entidade,universidade,conselhos,
empresa,taxa,transacao,instalacao,canalstreaming,ingresso,taxaempresa,pacote,contasapagar,
certificado,papel,pessoa,tutorial,workshops,palestra,atividadesocial,concurso,reuniao,
apresentacaodeartigo,artigo,grupomusical,musica,anuncioonline,perfilredesocial,avaliacao,
pontodetransporte,hotel,restaurante,estacaometro,veiculo,transfer,ocorreem1,contribui,ocorreem2,
compostopor,beneficio,compostapor1,desconta,desconto,promove,ministradopor2,
ministradopor1,palestradapor1,participadapor2,concorridopor,juizadopor,ministradapor,participade,
escritopor,dirigidopor,playlist,compostapor2,toca,redesocial,publicadoem,registradoem1,levaate1,
levaate2,notafiscal,pagamento,recibo
RESTART IDENTITY;

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public IS 'standard public schema';