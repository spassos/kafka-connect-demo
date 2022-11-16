CREATE DATABASE db;
GO
USE db
GO
CREATE TABLE paciente (
                id_paciente INTEGER IDENTITY NOT NULL,
                nome VARCHAR(200) NOT NULL,
                cpf VARCHAR(11) NOT NULL,
                data_nascimento DATE NOT NULL,
                data_hora_inclusao DATETIME NOT NULL,
                usuario_inclusao VARCHAR(20) NOT NULL,
                data_hora_alteracao DATETIME NULL,
                usuario_alteracao VARCHAR(20) NULL,
                status CHAR(1) NOT NULL,
                CONSTRAINT pk_paciente PRIMARY KEY (id_paciente)
);
GO
CREATE TABLE paciente_contato (
                id_contato INTEGER IDENTITY NOT NULL,
                id_paciente INTEGER NOT NULL,
                tipo_contato CHAR(1) NOT NULL,
                ddd INTEGER NOT NULL,
                telefone INTEGER NOT NULL,
                email VARCHAR(100) NOT NULL,
                instagram VARCHAR(50) NOT NULL,
                facebook VARCHAR(50) NOT NULL,
                data_hora_inclusao DATETIME NOT NULL,
                usuario_inclusao VARCHAR(20) NOT NULL,
                data_hora_alteracao DATETIME NULL,
                usuario_alteracao VARCHAR(20) NULL,
                status CHAR(1) NOT NULL,
                CONSTRAINT pk_contato PRIMARY KEY (id_contato, id_paciente)
);
GO
CREATE TABLE paciente_endereco (
                id_paciente_endereco INTEGER IDENTITY NOT NULL,
                id_paciente INTEGER NOT NULL,
                cep VARCHAR(10) NOT NULL,
                logradouro VARCHAR(200) NOT NULL,
                numero INTEGER NOT NULL,
                complemento VARCHAR(200) NULL,
                bairro VARCHAR(100) NOT NULL,
                cidade VARCHAR(100) NOT NULL,
                uf CHAR(2) NOT NULL,
                data_hora_inclusao DATETIME NOT NULL,
                usuario_inclusao VARCHAR(20) NOT NULL,
                data_hora_alteracao DATETIME NULL,
                usuario_alteracao VARCHAR(20) NULL,
                status CHAR(1) NOT NULL,
                CONSTRAINT pk_paciente_endereco PRIMARY KEY (id_paciente_endereco, id_paciente)
);
GO
ALTER TABLE paciente_endereco ADD CONSTRAINT paciente_paciente_endereco_fk FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);
GO
ALTER TABLE paciente_contato ADD CONSTRAINT paciente_contato_fk FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);
GO
INSERT INTO db.dbo.paciente
(nome, cpf, data_nascimento, data_hora_inclusao, usuario_inclusao, data_hora_alteracao, usuario_alteracao, status)
VALUES('Vitór Gomes Cavalcanti', '70617936510', '1990-11-15', getdate(), 'admin', null, null, 'A');
GO
INSERT INTO db.dbo.paciente_contato
(id_paciente, tipo_contato, ddd, telefone, email, instagram, facebook, data_hora_inclusao, usuario_inclusao, data_hora_alteracao, usuario_alteracao, status)
VALUES(1, 'R', 62, 70952446, 'vitorgomes@dayrep.com', '@vitorgomes', '@vitorgomes', getdate(), 'admin', null, null, 'A');
GO
INSERT INTO db.dbo.paciente_endereco
(id_paciente, cep, logradouro, numero, complemento, bairro, cidade, uf, data_hora_inclusao, usuario_inclusao, data_hora_alteracao, usuario_alteracao, status)
VALUES(1, '74674-310', 'Rua J 65', 1645, '', 'CENTRO', 'GOIÂNIA', 'GO', getdate(), 'admin', null, null, 'A');
GO
INSERT INTO db.dbo.paciente
(nome, cpf, data_nascimento, data_hora_inclusao, usuario_inclusao, data_hora_alteracao, usuario_alteracao, status)
VALUES('Mariana Sousa Correia', '10934492921', '1983-05-28', getdate(), 'admin', null, null, 'A');
GO
INSERT INTO db.dbo.paciente_contato
(id_paciente, tipo_contato, ddd, telefone, email, instagram, facebook, data_hora_inclusao, usuario_inclusao, data_hora_alteracao, usuario_alteracao, status)
VALUES(2, 'R', 11, 57509472, 'marianacorreia@dayrep.com', '@marianacorreia', '@marianacorreia', getdate(), 'admin', null, null, 'A');
GO
INSERT INTO db.dbo.paciente_endereco
(id_paciente, cep, logradouro, numero, complemento, bairro, cidade, uf, data_hora_inclusao, usuario_inclusao, data_hora_alteracao, usuario_alteracao, status)
VALUES(2, '08583-420', 'Rua Fialho de Almeida', 1449, '', 'CENTRO', 'ITAQUECETUBA', 'SP', getdate(), 'admin', null, null, 'A');
GO
USE db
GO
EXEC sys.sp_cdc_enable_db
GO
USE db
GO
EXEC sys.sp_cdc_enable_table @source_schema = N'dbo', @source_name = N'paciente', @role_name = NULL, @filegroup_name = N'PRIMARY'
GO
EXEC sys.sp_cdc_enable_table @source_schema = N'dbo', @source_name = N'paciente_contato', @role_name = NULL, @filegroup_name = N'PRIMARY'
GO
EXEC sys.sp_cdc_enable_table @source_schema = N'dbo', @source_name = N'paciente_endereco', @role_name = NULL, @filegroup_name = N'PRIMARY'
GO