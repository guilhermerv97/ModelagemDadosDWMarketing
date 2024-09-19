# ModelagemDadosDWMarketing
Modelagem e Implementação de um Data Warehouse de Marketing, usando Docker e um banco de dados PostgreSQL.

Projeto feito no curso "Modelagem e Análise de Dados com Power BI" da Pós-Graduação em Análise de Dados da Data Science Academy/ Faculdade VINCIT.

1.	Definição do Problema de Negócio
DSAMarketSmart é uma agência de marketing digital que se destaca na criação e execução de estratégias de comunicação digital para empresas de diversos setores. A empresa oferece uma ampla gama de serviços que incluem campanhas de e-mail marketing, gestão de redes sociais, anúncios pagos, otimização para motores de busca (SEO) e análise de dados. Utilizando uma plataforma interna, a DSAMarketSmart gerencia todas as operações de marketing digital de seus clientes, assegurando que cada campanha seja cuidadosamente monitorada e otimizada para alcançar os melhores resultados possíveis.

O cenário de negócio da DSAMarketSmart é dinâmico e competitivo, exigindo uma abordagem flexível e personalizada para cada cliente. As empresas que contratam os serviços da DSAMarketSmart buscam promover seus produtos e serviços através de campanhas eficazes e direcionadas. Essas campanhas, que constituem o núcleo das atividades da agência, são meticulosamente planejadas para atingir objetivos específicos, como aumentar a visibilidade da marca, gerar leads qualificados ou impulsionar vendas.

Dentro das operações da DSAMarketSmart, os anúncios pagos ocupam um papel central. Eles são criados e distribuídos em plataformas como Google Ads e Facebook Ads, onde são constantemente ajustados para maximizar o retorno sobre o investimento. Paralelamente, as campanhas de e-mail marketing são enviadas para listas de contatos selecionadas, com o objetivo de manter um relacionamento contínuo com os clientes e prospects. 
A gestão de redes sociais é outro pilar importante da estratégia da DSAMarketSmart. A empresa não apenas publica conteúdos relevantes e engajantes em plataformas como Facebook, Instagram e X (Twitter), mas também interage ativamente com os seguidores para fortalecer a presença digital dos clientes. Além disso, as atividades de SEO são realizadas com foco em melhorar a visibilidade dos websites nos motores de busca, garantindo que as marcas se destaquem em um ambiente digital saturado.

Para monitorar o desempenho dessas atividades, a DSAMarketSmart utiliza relatórios detalhados que fornecem insights sobre métricas críticas. Esses relatórios permitem à equipe da agência avaliar a eficácia das campanhas em tempo real e identificar áreas de melhoria.
Com o objetivo de aprimorar ainda mais a eficácia das suas operações, a DSAMarketSmart está implementando um Data Warehouse. Este sistema permitirá consolidar dados de múltiplas fontes, proporcionando uma visão holística das operações de marketing. Além disso, o Data Warehouse fornecerá insights valiosos sobre o desempenho das campanhas, ajudando a identificar tendências e oportunidades de otimização. Dessa forma, a tomada de decisões será cada vez mais baseada em dados, o que permitirá à DSAMarketSmart ajustar suas estratégias de maneira mais precisa e eficiente, garantindo resultados superiores para seus clientes.
Operações e Atividades Principais

Clientes: Empresas que contratam os serviços da DSAMarketSmart para promover seus produtos e serviços.

Campanhas: Iniciativas de marketing digital realizadas para alcançar objetivos específicos para os clientes.
Anúncios: Conteúdos promovidos em várias plataformas (Google Ads, Facebook Ads,
etc.).
E-mails: Campanhas de e-mail marketing enviadas para listas de contatos específicas. Redes Sociais: Publicações e interações realizadas em plataformas como Facebook,
Instagram, X (Twitter), etc.

SEO: Atividades de otimização de websites para melhorar a visibilidade nos motores de
busca.
Relatórios: Análises e métricas sobre o desempenho das campanhas e atividades.
 

Objetivos do Data Warehouse

Consolidar dados de várias fontes para obter uma visão holística das operações de marketing.
Fornecer insights sobre o desempenho das campanhas e atividades.
Identificar tendências e oportunidades de melhoria.
Ajudar na tomada de decisão baseada em dados para otimizar estratégias de marketing.
2.	Modelagem do Data Warehouse (DW)
Modelagem de dados é um processo utilizado para definir e analisar os requisitos de dados necessários para suportar os processos de negócios de uma organização. Esse processo envolve a criação de um modelo conceitual que representa a estrutura lógica e, muitas vezes, física dos dados, independentemente de como esses dados serão armazenados ou recuperados.
A modelagem de dados pode ser dividida em várias fases, incluindo:
Modelo Conceitual: Nesta fase, são identificadas as principais entidades (ou objetos de dados), bem como os relacionamentos entre elas. Isso fornece uma visão de alto nível dos dados na organização.
Modelo Dimensional: A partir da definição das entidades, elas são organizadas em dois grupos: “dimensões” e “fatos”. As tabelas fato armazenam as medidas quantitativas a serem analisadas, como, por exemplo, cada venda em um DW de vendas. Já as tabelas dimensão contêm detalhes descritivos ou atributos sobre as dimensões. Ainda no exemplo das vendas, tabelas dimensões trariam informações sobre tempo, localidade, produtos, clientes, vendedores etc. O modelo dimensional visa, ainda, como relacionar as tabelas fato e dimensão entre si.
Modelo Lógico: Uma vez que o modelo conceitual é definido, ele pode ser transformado em um modelo lógico, que detalha a estrutura dos dados, incluindo tabelas, colunas, tipos de dados e relações entre as tabelas. Este modelo ainda não está atrelado a um sistema de gerenciamento de banco de dados específico.
Modelo Físico: O modelo lógico é então traduzido em um modelo físico que define como os dados serão armazenados em um banco de dados específico. Ele inclui detalhes como a definição de tabelas, índices, triggers, procedimentos armazenados e outros elementos específicos do sistema de gerenciamento de banco de dados.
2.1.	Modelo Conceitual
Entidades
Empresa	(Clientes):	Representa	as	empresas	que	contratam	os	serviços	da DSAMarketSmart.
Campanha: Representa as iniciativas de marketing digital realizadas para os clientes.
Anúncio: Refere-se aos conteúdos pagos promovidos em plataformas como Google Ads e Facebook Ads.
E-mail: Representa as campanhas de e-mail marketing enviadas para listas de contatos específicas.

Rede Social: Representa as plataformas de redes sociais onde a DSAMarketSmart publica conteúdos e interage com os seguidores (Facebook, Instagram, X).
SEO: Refere-se às atividades de otimização de websites para melhorar a visibilidade nos motores de busca.
 

Atributos

Empresa

•	Nome da Empresa
•	Setor de Atuação
•	Objetivos de Marketing
•	Contato Campanha
•	Tipo de Campanha (e-mail marketing, anúncios, SEO, etc.)
•	Objetivos da Campanha
•	Data de Início e Fim
•	Orçamento Anúncio
•	Plataforma (Google Ads, Facebook Ads, etc.)
•	Custo por Clique (CPC)
•	Impressões
•	Cliques
•	Retorno sobre Investimento (ROI) E-mail
•	Lista de Contatos
•	Taxa de Abertura
•	Taxa de Cliques
•	Conteúdo Rede Social
•	Plataforma (Facebook, Instagram, X)
•	Número de Publicações
•	Engajamento (Curtidas, Comentários, Compartilhamentos)
•	Crescimento de Seguidores
 

SEO

•	Palavras-chave
•	Ranking de Busca
•	Tráfego Orgânico
•	Taxa de Conversão

Relacionamentos
Empresa - Campanha
•	Uma empresa pode ter várias campanhas.
•	Cada campanha é associada a uma empresa.

Campanha - Anúncio
•	Uma campanha pode ter vários anúncios.
•	Cada anúncio pertence a uma campanha.

Campanha - E-mail

•	Uma campanha pode incluir várias campanhas de e-mail marketing.
•	Cada e-mail marketing pertence a uma campanha.

Campanha - Rede Social

•	Uma campanha pode incluir várias atividades em redes sociais.
•	Cada atividade de rede social pertence a uma campanha.
Campanha - SEO

•	Uma campanha pode incluir várias atividades de SEO.
•	Cada atividade de SEO pertence a uma campanha.


2.2.	Modelo Dimensional
Com base nas entidades, atributos e relacionamentos identificados para a DSAMarketSmart, podemos criar um modelo dimensional de um Data Warehouse. O modelo será composto por 4 dimensões principais e uma tabela fato central.
Dimensões:

•	Dim_Empresa
•	Dim_Tempo
•	Dim_Plataforma
•	Dim_Campanha Tabela Fato:
•	Fato_Campanha
 

Descrição das Tabelas

Dim_Empresa

Contém informações sobre as empresas que contratam os serviços da DSAMarketSmart.
•	SK_Empresa (SK/PK)
•	ID_Empresa (NK)
•	Nome_Empresa
•	Setor_Atuacao
•	Objetivos_Marketing
•	Contato

Dim_Tempo
Representa a dimensão de tempo, útil para analisar o desempenho das campanhas ao longo de diferentes períodos.
•	SK_Tempo (SK/PK)
•	Data_Completa
•	Dia
•	Mês
•	Ano

Dim_Plataforma
Descreve as diferentes plataformas onde as campanhas são realizadas.
•	SK_Plataforma (SK/PK)
•	ID_Plataforma (NK)
•	Nome_Plataforma (Google Ads, Facebook Ads, E-mail, SEO, Redes Sociais)
Dim_Campanha

Detalha as características das campanhas de marketing digital.

•	SK_Campanha (SK/PK)
•	ID_Campanha (NK)
•	Tipo_Campanha (E-mail marketing, Anúncios, etc.)
•	Data_Inicio
•	Data_Fim
•	Orçamento
 

Fato_Campanha

 

digital.
 
A tabela fato centraliza as métricas e medidas relevantes para as campanhas de marketing


•	SK_Empresa (Chave Estrangeira de Dim_Empresa)
•	SK_Tempo (Chave Estrangeira de Dim_Tempo)
•	SK_Plataforma (Chave Estrangeira de Dim_Plataforma)
•	SK_Campanha (Chave Estrangeira de Dim_Campanha)
•	Custo_Total
•	Impressões
•	Cliques
•	CPC (Custo por Clique)
•	ROI (Retorno sobre Investimento)
•	Engajamento (Curtidas, Comentários, Compartilhamentos)
•	Taxa_Abertura (Para e-mails)
•	Taxa_Conversão (Para SEO e campanhas em geral)
 

Relacionamentos

Aqui estão os relacionamentos entre as tabelas dimensionais e a tabela fato, com a respectiva cardinalidade:

Relacionamento entre Dim_Empresa e Fato_Campanha:

Uma empresa pode estar associada a várias campanhas, mas cada campanha está associada a apenas uma empresa.

Relacionamento entre Dim_Tempo e Fato_Campanha:

Cada período de tempo pode estar associado a várias campanhas, mas cada campanha está associada a apenas um período de tempo específico.
Relacionamento entre Dim_Plataforma e Fato_Campanha:

Cada plataforma pode ser utilizada em várias campanhas, mas cada campanha utiliza uma única plataforma por vez na tabela fato.

Relacionamento entre Dim_Campanha e Fato_Campanha:

Uma campanha pode gerar várias entradas na tabela fato, correspondentes a diferentes períodos de tempo, plataformas ou outras dimensões.

2.3.	Modelo Lógico

Tabelas:
Tabela Dim_Empresa

•	SK_Empresa: INT (Primary Key, Auto Numérico)
•	ID_Empresa: VARCHAR(50) (Natural Key)
•	Nome_Empresa: VARCHAR(255)
•	Setor_Atuacao: VARCHAR(100)
•	Contato: VARCHAR(100)

Tabela Dim_Tempo
•	SK_Tempo: INT (Primary Key, Auto Numérico)
•	Data_Completa: DATE
•	Dia: INT
•	Mês: INT
•	Ano: INT
 

Tabela Dim_Plataforma

•	SK_Plataforma: INT (Primary Key, Auto Numérico)
•	ID_Plataforma: VARCHAR(50) (Natural Key)
•	Nome_Plataforma: VARCHAR(100)
Tabela Dim_Campanha

•	SK_Campanha: INT (Primary Key, Auto Numérico)
•	ID_Campanha: VARCHAR(50) (Natural Key)
•	Tipo_Campanha: VARCHAR(100)
•	Data_Inicio: DATE
•	Data_Fim: DATE
•	Orçamento: DECIMAL(15, 2)
Tabela Fato_Campanha

•	SK_Empresa: INT (Foreign Key)
•	SK_Tempo: INT (Foreign Key)
•	SK_Plataforma: INT (Foreign Key)
•	SK_Campanha: INT (Foreign Key)
•	Custo_Total: DECIMAL(15, 2)
•	Impressões: INT
•	Cliques: INT
•	CPC (Custo por Clique): DECIMAL(10, 4)
•	ROI (Retorno sobre Investimento): DECIMAL(10, 4)
•	Engajamento: INT
•	Taxa_Abertura: DECIMAL(5, 2)
•	Taxa_Conversão: DECIMAL(5, 2) Relacionamentos
•	Dim_Empresa → Fato_Campanha: Relacionamento de 1 para N, usando a chave
estrangeira SK_Empresa.
•	Dim_Tempo → Fato_Campanha: Relacionamento de 1 para N, usando a chave
estrangeira SK_Tempo.
•	Dim_Plataforma → Fato_Campanha: Relacionamento de 1 para N, usando a chave
estrangeira SK_Plataforma.
•	Dim_Campanha → Fato_Campanha: Relacionamento de 1 para N, usando a chave
estrangeira SK_Campanha.


2.4.	Modelo Físico

O código SQL para implementação do primeiro modelo físico está anexado na pasta.

3.	Modelagem Avançada
3.1.	Slowly Changing Dimensions
Slowly Changing Dimensios (SCD) são dimensões que mudam lentamente ao longo do tempo. Para sua aplicação, pode ser feito, por exemplo, um histórico de mudanças. 
3.2.	 Junk Dimensions
Dimensões que combinam diversos atributos categóricos que possuem baixa cardinalidade e não possuem relação direta entre si em uma mesma tabela, com o intuito de evitar a criação de várias dimensões menores e simplificar o modelo.
3.3.	 Role-Playing Dimensions
Dimensões que podem desempenhar diferentes papéis em várias partes do modelo. São tabelas dimensão que podem ser citadas várias vezes em uma mesma tabela fato. Por exemplo, uma tabela calendário pode explicar datas de pedido, envio, entrega etc.

4.	Implementação do banco de dados
Após a modelagem avançada, o modelo final está pronto, e foi implementado em um bando de dados PostgreSQL através do SGBD pgAdmin. Para isso, foi feito um container em Docker. Todos os scripts estão anexados.
Os dados foram anexados a partir de arquivos csv gerados aleatoriamente.
