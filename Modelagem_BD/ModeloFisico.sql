CREATE DATABASE wggdb;

USE wggdb;

CREATE TABLE ALUNO(
    id_aluno INT NOT NULL AUTO_INCREMENT,
    nome_aluno VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL, 
    peso_kg DECIMAL(5,2) NOT NULL,
    idade INT NOT NULL,
    altura DECIMAL(5,2) NOT NULL,

    CONSTRAINT ALUNO_PK PRIMARY KEY (id_aluno)
) ENGINE=InnoDB;

CREATE TABLE TREINO(
    id_treino INT NOT NULL AUTO_INCREMENT,
    nome_treino VARCHAR(60) NOT NULL,
    descricao_treino VARCHAR(255) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    num_series INT NOT NULL,
    id_aluno INT NOT NULL,

    CONSTRAINT TREINO_PK PRIMARY KEY (id_treino),
    CONSTRAINT TREINO_ALUNO_FK FOREIGN KEY (id_aluno)
        REFERENCES ALUNO(id_aluno)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE EXERCICIO(
    id_exercicio INT NOT NULL AUTO_INCREMENT,
    nome_exercicio VARCHAR(60) NOT NULL,
    descricao_exercicio VARCHAR(255) NOT NULL,
    num_repeticoes INT NOT NULL,

    CONSTRAINT EXERCICIO_PK PRIMARY KEY (id_exercicio)
) ENGINE=InnoDB;

CREATE TABLE possui(
    id_treino INT NOT NULL,
    id_exercicio INT NOT NULL,

    CONSTRAINT possui_TREINO_FK FOREIGN KEY (id_treino)
        REFERENCES TREINO(id_treino)
        ON DELETE CASCADE,

    CONSTRAINT possui_EXERCICIO_FK FOREIGN KEY (id_exercicio)
        REFERENCES EXERCICIO(id_exercicio)
        ON DELETE CASCADE,

    PRIMARY KEY (id_treino, id_exercicio)
) ENGINE=InnoDB;

CREATE TABLE IMC(
    id_imc INT NOT NULL AUTO_INCREMENT,
    valor_imc DECIMAL(5,3) NOT NULL,
    dt_calculo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_aluno INT NOT NULL,

    CONSTRAINT IMC_PK PRIMARY KEY (id_imc),
    CONSTRAINT IMC_ALUNO_FK FOREIGN KEY (id_aluno)
        REFERENCES ALUNO(id_aluno)
        ON DELETE CASCADE
) ENGINE=InnoDB;
