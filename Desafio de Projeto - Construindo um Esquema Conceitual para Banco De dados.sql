CREATE TABLE `clientes` (
  `id_cliente` integer PRIMARY KEY,
  `nome` varchar(255),
  `cpf` varchar(255) UNIQUE,
  `telefone` varchar(255)
);

CREATE TABLE `veiculos` (
  `id_veiculo` integer PRIMARY KEY,
  `modelo` varchar(255),
  `placa` varchar(255) UNIQUE,
  `ano` integer,
  `id_cliente` integer
);

CREATE TABLE `mecanicos` (
  `id_mecanico` integer PRIMARY KEY,
  `nome` varchar(255),
  `endereco` varchar(255),
  `especialidade` varchar(255)
);

CREATE TABLE `equipes` (
  `id_equipe` integer PRIMARY KEY,
  `nome_equipe` varchar(255)
);

CREATE TABLE `equipes_mecanicos` (
  `id_equipe` integer,
  `id_mecanico` integer
);

CREATE TABLE `ordens_servico` (
  `id_os` integer PRIMARY KEY,
  `data_emissao` date,
  `data_conclusao` date,
  `valor_total` decimal(10,2),
  `status` varchar(255),
  `id_equipe` integer
);

CREATE TABLE `servicos` (
  `id_servico` integer PRIMARY KEY,
  `descricao` varchar(255),
  `valor_mao_obra` decimal(10,2)
);

CREATE TABLE `os_servicos` (
  `id_os` integer,
  `id_servico` integer,
  `quantidade` integer
);

CREATE TABLE `pecas` (
  `id_peca` integer PRIMARY KEY,
  `descricao` varchar(255),
  `preco` decimal(10,2)
);

CREATE TABLE `os_pecas` (
  `id_os` integer,
  `id_peca` integer,
  `quantidade` integer
);

ALTER TABLE `veiculos` ADD FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

ALTER TABLE `ordens_servico` ADD FOREIGN KEY (`id_equipe`) REFERENCES `equipes` (`id_equipe`);

ALTER TABLE `os_servicos` ADD FOREIGN KEY (`id_os`) REFERENCES `ordens_servico` (`id_os`);

ALTER TABLE `os_servicos` ADD FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id_servico`);

ALTER TABLE `os_pecas` ADD FOREIGN KEY (`id_os`) REFERENCES `ordens_servico` (`id_os`);

ALTER TABLE `os_pecas` ADD FOREIGN KEY (`id_peca`) REFERENCES `pecas` (`id_peca`);

ALTER TABLE `equipes_mecanicos` ADD FOREIGN KEY (`id_equipe`) REFERENCES `equipes` (`id_equipe`);

ALTER TABLE `equipes_mecanicos` ADD FOREIGN KEY (`id_mecanico`) REFERENCES `mecanicos` (`id_mecanico`);
