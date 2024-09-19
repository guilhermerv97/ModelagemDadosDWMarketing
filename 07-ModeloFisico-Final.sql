-- Modelo Físico do DW - Implementação de Role-Playing Dimension

-- Criação do schema
CREATE SCHEMA dsap5 AUTHORIZATION dsa;

-- SCD Tipo 2
-- Tabela Dim_Empresa com SCD Tipo 2
CREATE TABLE dsap5.Dim_Empresa (
    SK_Empresa INT NOT NULL PRIMARY KEY,
    ID_Empresa VARCHAR(50) NOT NULL,
    Nome_Empresa VARCHAR(255) NOT NULL,
    Setor_Atuacao VARCHAR(100),
    Contato VARCHAR(100),
    Data_Inicio DATE NOT NULL,   -- Data de início de validade do registro
    Data_Fim DATE,               -- Data de fim de validade do registro (NULL para o registro atual)
    Flag_Atual BOOLEAN NOT NULL  -- Indicador de registro atual (True para o registro atual)
);

-- SCD Tipo 3
-- Tabela Dim_Campanha com SCD Tipo 3
CREATE TABLE dsap5.Dim_Campanha (
    SK_Campanha INT NOT NULL PRIMARY KEY,
    ID_Campanha VARCHAR(50) NOT NULL,
    Tipo_Campanha VARCHAR(100) NOT NULL,
    Orcamento DECIMAL(15, 2),
    Tipo_Campanha_Anterior VARCHAR(100),  -- Armazena o valor anterior de Tipo_Campanha
    Orcamento_Anterior DECIMAL(15, 2)     -- Armazena o valor anterior de Orcamento
);

-- Junk Dimension 
-- Contém atributos de baixa cardinalidade evitando assim a criação de muitas dimensões
-- Normalmente a Junk Dimension é conectada diretamente à tabela fato (embora possa fazer parte da normalização de uma outra dimensão)
CREATE TABLE dsap5.Dim_Extras_Campanha_Plataforma (
    SK_Extras_Campanha_Plataforma INT NOT NULL PRIMARY KEY,
    Tipo_Dispositivo VARCHAR(15),          -- Cardinalidade de 2 (Smartphone, Desktop)
    Status_Global VARCHAR(30),             -- Cardinalidade de 3 (Não Atendeu Expectativa, Atendeu Expectativa, Superou Expectativa)
    Categoria_Publico_Alvo VARCHAR(15)     -- Cardinalidade de 5 (Adolescente, Jovem, Adulto, Senior, Idoso)
);

-- Tabela Dim_Plataforma
CREATE TABLE dsap5.Dim_Plataforma (
    SK_Plataforma INT NOT NULL PRIMARY KEY,
    ID_Plataforma VARCHAR(50) NOT NULL,
    Nome_Plataforma VARCHAR(100) NOT NULL
);

-- Role-Playing Dimension
-- Permite analisar mais de um tipo de informação
-- Tabela Dim_Tempo
CREATE TABLE dsap5.Dim_Tempo (
    SK_Tempo INT NOT NULL PRIMARY KEY,
    Data_Completa DATE NOT NULL,
    Dia INT NOT NULL,
    Mes INT NOT NULL,
    Ano INT NOT NULL
);

-- Tabela Fato_Campanha
-- Recebe a chave da Junk Dimension
-- Relação com Dim_Tempo mais de uma vez para representar a Role-Playing Dimension
CREATE TABLE dsap5.Fato_Campanha (
    SK_Empresa INT NOT NULL,
    SK_Tempo_Inicio_Campanha INT NOT NULL,  -- Referencia a data de início da campanha
    SK_Tempo_Fim_Campanha INT NOT NULL,     -- Referencia a data de término da campanha
    SK_Plataforma INT NOT NULL,
    SK_Campanha INT NOT NULL,
    SK_Extras_Campanha_Plataforma INT NOT NULL,
    Custo_Total DECIMAL(15, 2),
    Impressoes INT,
    Cliques INT,
    CPC DECIMAL(10, 4),
    ROI DECIMAL(10, 4),
    Engajamento INT,
    Taxa_Abertura DECIMAL(5, 2),
    Taxa_Conversao DECIMAL(5, 2),
    FOREIGN KEY (SK_Empresa) REFERENCES dsap5.Dim_Empresa(SK_Empresa),
    FOREIGN KEY (SK_Tempo_Inicio_Campanha) REFERENCES dsap5.Dim_Tempo(SK_Tempo),
    FOREIGN KEY (SK_Tempo_Fim_Campanha) REFERENCES dsap5.Dim_Tempo(SK_Tempo),
    FOREIGN KEY (SK_Plataforma) REFERENCES dsap5.Dim_Plataforma(SK_Plataforma),
    FOREIGN KEY (SK_Campanha) REFERENCES dsap5.Dim_Campanha(SK_Campanha),
    FOREIGN KEY (SK_Extras_Campanha_Plataforma) REFERENCES dsap5.Dim_Extras_Campanha_Plataforma(SK_Extras_Campanha_Plataforma)
);
