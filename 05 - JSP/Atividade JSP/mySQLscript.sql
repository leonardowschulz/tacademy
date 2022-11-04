CREATE DATABASE jsp;

CREATE TABLE posts(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    titulo VARCHAR(100),
    post VARCHAR(10000)
);

CREATE TABLE comentario(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    comentario VARCHAR(300),
    codigo_post INT,
    abilitado BOOL
);

CREATE TABLE usuarios(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(30),
    senha VARCHAR(30),
    nome VARCHAR(30),
    acessoadm BOOL,
    banido BOOL
);

INSERT INTO posts VALUES
(null, "Leonardo", "Primeiro título", "Primeiro texto"),
(null, "Leonardo", "Apple slashes budgets and implements broad hiring freeze, report claims", "A report claims that Apple has paused almost all hiring. The company had announced a slowdown in hiring earlier this year, but it said that it would still be hiring on a deliberate basis. Apple reportedly has not designated any of its budget for new staff in the coming year. The hiring freeze is expected to continue through to late 2023."),
(null, "Leonardo", "Netflix With Ads Launching as Talks Continue With Studios Over Content", "Netflix is launching its ad-supported tier today in the US for $6.99 a month. The company is currently still in talks with several major studios to finalize licensing agreements. The new tier doesn't include Netflix's complete library. Customers will see around four to five minutes of ads per hour of content."),
(null, "Leonardo", "SpaceX is now building a Raptor engine a day", "SpaceX has made substantial progress with its Raptor rocket engine and the storage of liquid oxygen and methane propellant in orbit. The company can now build seven Raptor 2.0 engines a week and it is rapidly iterating on its processes to produce higher-quality engines. SpaceX is working towards demonstrations of its cryogenic propellant storage and transfer technology. It is targeting early December for a test flight of Starship and Super Heavy."),
(null, "Leonardo", "Why Pfizer’s RSV vaccine success is a big deal, decades in the making", "Respiratory syncytial virus (RSV) is a common seasonal virus that poses a serious risk to infants and toddlers. Nearly everyone is infected during childhood and most experience only mild illness, but a small fraction of children end up with life-threatening symptoms. The disease kills over 100,000 children under five each year. Pfizer's experimental vaccine was shown to help protect newborns against the virus and it could be available in time for next year's RSV season."),
(null, "Leonardo", "Grafana Phlare (GitHub Repo)", "Grafana Phlare is a system for aggregating continuous profiling data. Continuous profiling allows developers to understand resource usage down to the exact line of code. Grafana Phlare is fully integrated with Grafana."),
(null, "Leonardo", "hishtory (GitHub Repo)", "hishtory stores shell history in context and makes it easily queryable. The data is stored locally and end-to-end encrypted for syncing to other computers. Shell history from one system can be queried remotely from other computers."),
(null, "Leonardo", "George Hotz, aka ‘geohot’ is leaving Comma.ai for a lofty AI project", "George Hotz, famous iPhone and Playstation 3 hacker, is taking some time away from Comma.ai, a driver assistance system startup, to write a new framework for machine learning that is faster and less complex than PyTorch. He is still Comma.ai's sole board member and president. Hotz hasn't been involved in day-to-day leadership tasks for some time. His new startup, Tiny Corporation, will build tools that allow ML models to be trained at the edge."),
(null, "Leonardo", "$550 PlayStation VR2 launches on Feb. 22, 2023", "The new headset uses inside-out tracking and doesn't require an external camera."),
(null, "Leonardo", "Hackers roubam 130 repositórios da Dropbox no GitHub", "Foram obtidas chaves de API, emails de funcionários, clientes e fornecedores. Credenciais de clientes e código dos principais aplicativos e infraestrutura da empresa não foram afetados. As informações são do site Bleeping Computer."),
(null, "Leonardo", "Cientistas da Arábia Saudita desenvolvem vidro inteligente", "O sistema – que pode substituir o WiFi durante a dia – consome apenas 1 watt (até 95% menos do que um roteador tradicional), mas atinge uma velocidade de apenas 16 Kbps no momento. Apesar de alterar a polaridade da luz solar rapidamente, a frequência não é perceptível ao olho humano. As informações são do site New Atlas.");


SELECT * FROM posts;

INSERT INTO usuarios VALUES
(1, "Leonardo", "123", "Leo", 1, 0),
(2, "Tester", "123", "Testerrrr", 0, 0),
(3, "Banned", "123", "Bloquedo", 0, 1),
(4, "Caroline", "123", "Caroline23", 0, 0);
