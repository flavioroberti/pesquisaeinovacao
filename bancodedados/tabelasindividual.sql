-- CRIANDO BANCO DE DADOS PROJETO
CREATE DATABASE projeto;

-- USANDO O BANCO DE DADOS PROJETO
use projeto;

-- CRIANDO TABELA CADASTRO
CREATE TABLE cadastro(
idCadastro INT PRIMARY KEY auto_increment,
cpf CHAR(11),
cnpj CHAR(14),
usuario VARCHAR(40),
senha CHAR(8),
email VARCHAR(80)
);


-- INSERINDO VALORES NA TABELA 
INSERT INTO cadastro(cpf, cnpj, usuario, senha, email) VALUES
('12869482391','78965478910253', 'flavioroberti', '03040506', 'flavio.roque@sptech.school'),
('98843212938','87694181334551', 'sandroguedes', '12345678', 'sandro.guedes@sptech.school'),
('47778112373','45277891223901', 'gustavovieck', '87654321', 'gustavo.vieck@sptech,school'),
('39184721221','32210596849322', 'andreboer', '21436587', 'andre.boer@sptech.school'),
('54932455112','52217785187596', 'luisfernando', '98657891', 'luis.fernando@sptech.school'),
('67451396107','35387653161052', 'enzodefreitas', '09876543', 'enzo.defreitas@sptech.school');

-- DESCREVENDO OS CAMPOS DA TABELA
DESCRIBE cadastro;

-- EXIBINDO OS DADOS INSERIDOS 
SELECT * FROM cadastro;

-- EXIBINDO O USUARIO QUE COMEÇA COM S
SELECT usuario FROM cadastro WHERE usuario LIKE 'S%';

-- EXIBINDO O USUARIO QUE TERMINA COM S
SELECT usuario FROM cadastro WHERE usuario LIKE '%S';

-- EXIBINDO O USUARIO QUE É DIFERENTE DE ANDRE BOER
SELECT usuario FROM cadastro WHERE usuario <> 'andreboer';

-- EXIBINDO OS USUARIOS EM ORDEM DECRESCENTE 
SELECT usuario FROM cadastro ORDER BY usuario DESC;

-- MODIFICANDO A COLUMA USUARIO PARA VARCHAR(60)
ALTER TABLE cadastro MODIFY COLUMN usuario VARCHAR(60);

-- ATUALIZANDO A SENHA DO USUARIO QUE CONTEM O ID=3
UPDATE cadastro SET senha='38456791' WHERE idCadastro= 3;

-- ATUALIZANDO O CNPJ DO USUARIO QUE CONTEM O ID=5
UPDATE cadastro SET cnpj='34912801334516' WHERE idCadastro = 5;

-- EXIBINDO OS DADOS ATUALIZADOS DA TABELA 
SELECT * FROM cadastro;

-- LIMPANDO OS DADOS DA TABELA cadastro
TRUNCATE TABLE cadastro;

-- EXCLUINDO A TABELA cadastro
DROP TABLE cadastro;




-- ..................................................................



-- CRIANDO A TABELA DADOS
CREATE TABLE dados (
idDado INT PRIMARY KEY auto_increment,
nomeSensor VARCHAR(50),
funcaoSensor VARCHAR(50), 
umidade DECIMAL(5,2),
situacaoSensor VARCHAR(50),
constraint chkSituacao check(situacaoSensor IN( 'Necessita de Manutenção','Operando sem problemas')),
operacaoSensor VARCHAR(50),
constraint chkOperacao check(operacaoSensor IN( 'Ligado','Desligado'))
);

-- EXIBINDO A ESTRUTURA DA TABELA
DESCRIBE dados;

-- INSERINDO OS VALORES
INSERT INTO dados (nomeSensor, funcaoSensor, umidade, situacaoSensor, operacaoSensor) VALUES
('Sensor de Umidade do Solo Capacitivo', 'Monitorar a umidade do solo',28.50,'Operando sem problemas','Ligado'),
('Sensor de Umidade do Solo Capacitivo', 'Monitorar a umidade do solo',NULL,'Necessita de Manutenção','Desligado'),
('Sensor de Umidade do Solo Capacitivo', 'Monitorar a umidade do solo',NULL,'Operando sem problemas','Desligado'),
('Sensor de Umidade do Solo Capacitivo', 'Monitorar a umidade do solo',34.84,'Necessita de Manutenção','Ligado');

-- EXIBIR OS DADOS INSERIDOS NA TABELA
SELECT * FROM dados;

-- ALTERAR COLUNA UMIDADE DA TABELA
ALTER TABLE dados RENAME COLUMN umidade TO dadosUmidade;

-- ADICIONAR CHECK NA FUNÇÃO DO SENSOR
ALTER TABLE dados ADD CONSTRAINT chkFuncao CHECK(funcaoSensor IN('Monitorar a Umidade Do Solo'));

-- ADICIONAR UM CAMPO CHAMADO dataAquisicao
ALTER TABLE dados ADD COLUMN dataAquisicao DATE;

UPDATE dados SET dataAquisicao = '2025-02-14' WHERE idDado= 1;
UPDATE dados SET dataAquisicao = '2025-01-28' WHERE idDado= 2;
UPDATE dados SET dataAquisicao = '2025-03-11' WHERE idDado= 3;
UPDATE dados SET dataAquisicao = '2025-02-07' WHERE idDado= 4;

-- EXIBIR OS DADOS NOVOS INSERIDOS NA TABELA
SELECT * FROM dados;

-- APELIDAR A COLUNA dadosTemperatura e dadosUmidade
SELECT dadosUmidade AS 'Dados de Umidade' FROM dados;

-- APELIDAR A COLUNA nomeSensor, situacaoSensor
SELECT nomeSensor AS 'Nome do Sensor', situacaoSensor AS 'Situação do Sensor' FROM dados;

-- EXIBIR TODOS DADOS DA TABELA JA PRONTA
SELECT * FROM dados;

-- LIMPAR OS DADOS DA TABELA
TRUNCATE TABLE dados;

-- EXCLUIR TABELA
DROP TABLE dados;

-- ..............................................

CREATE TABLE plantacao (
idPlantacao INT PRIMARY KEY auto_increment,
nomeFazenda VARCHAR(60),
tipoCacauPlantado VARCHAR(60),
qntPlantada DECIMAL(5,2),
qntColhida DECIMAL(5,2),
tipoAdubo VARCHAR(60),
tipoDeClima VARCHAR(60)
);

-- INSERINDO VALORES NA TABELA 
INSERT INTO plantacao(nomeFazenda, tipoCacauPlantado, qntPlantada, qntColhida,
tipoAdubo, tipoDeClima) VALUES
('Fazenda Panorama','Criollo',12.15,6.33,'Orgânico','Semiárido'),
('Fazenda Gaiato','Forasteiro',8.75,3.22,'Mineral','Tropical'),
('Rancho 7 Mares','Trinitário',11.89,6.51,'Foliar','Equatorial');

-- EXIBIR DADOS DA TABELA
SELECT * FROM plantacao;

-- ATUALIZAR DADOS DA TABELA
UPDATE plantacao SET qntPlantada=10.42 WHERE idPlantacao= 1;

-- EXIBIR qntPlantada COM APELIDO
SELECT qntPlantada AS 'Quantidade Plantada De Cacau' FROM plantacao;

-- ADICIONAR CHECK E CONSTRAINT
ALTER TABLE plantacao ADD CONSTRAINT chkClima check(tipoDeClima in('Semiárido','Tropical','Equatorial'));
ALTER TABLE plantacao ADD CONSTRAINT chkTipoCacau check(tipoCacauPlantado in('Criollo','Forasteiro','Trinitário'));

-- ADICIONAR NOVA COLUNA
ALTER TABLE plantacao ADD COLUMN dtPlantada DATE;

-- ATUALIZAR DADOS DA TABELA
UPDATE plantacao SET dtPlantada ='2025-02-13' WHERE idPlantacao= 1;
UPDATE plantacao SET dtPlantada ='2024-11-21' WHERE idPlantacao= 2;
UPDATE plantacao SET dtPlantada ='2025-01-08' WHERE idPlantacao= 3;

-- EXIBIR DADOS DA TABELA
SELECT * FROM plantacao;

-- EXIBIR O TIPO DE CACAU USANDO CASE
SELECT CASE WHEN tipoDeClima = 'Tropical' THEN 'Forasteiro' ELSE 'Criollo' 
END AS 'Tipo De Cacau' FROM plantacao; 

-- MOSTRAR ESTRUTURA INTEIRA DA TABELA
DESCRIBE plantacao;

TRUNCATE TABLE plantacao;

DROP TABLE plantacao;

DROP DATABASE projeto;










 
