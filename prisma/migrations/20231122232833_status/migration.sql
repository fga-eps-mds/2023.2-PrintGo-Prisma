-- CreateEnum
CREATE TYPE "EmpressoraStatus" AS ENUM ('ATIVO', 'DESATIVADO');

-- CreateEnum
CREATE TYPE "Cargo" AS ENUM ('USER', 'ADMIN', 'LOCADORA');

-- CreateTable
CREATE TABLE "users" (
    "id" STRING NOT NULL,
    "email" STRING NOT NULL,
    "nome" STRING NOT NULL,
    "senha" STRING NOT NULL,
    "documento" STRING NOT NULL,
    "unidade_id" STRING,
    "cargos" "Cargo"[] DEFAULT ARRAY['USER']::"Cargo"[],

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "padroes" (
    "id" STRING NOT NULL,
    "tipo" STRING NOT NULL,
    "marca" STRING NOT NULL,
    "modelo" STRING NOT NULL,
    "numeroSerie" STRING NOT NULL,
    "versaoFirmware" STRING NOT NULL,
    "tempoAtivoSistema" TIMESTAMP(3) NOT NULL,
    "totalDigitalizacoes" INT4 NOT NULL,
    "totalCopiasPB" INT4 NOT NULL,
    "totalCopiasColoridas" INT4 NOT NULL,
    "totalImpressoesPb" INT4 NOT NULL,
    "totalImpressoesColoridas" INT4 NOT NULL,
    "totalGeral" INT4 NOT NULL,
    "enderecoIp" STRING NOT NULL,

    CONSTRAINT "padroes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "impressoras" (
    "id" STRING NOT NULL,
    "padrao_id" STRING NOT NULL,
    "ip" STRING NOT NULL,
    "numeroSerie" STRING NOT NULL,
    "codigoLocadora" STRING NOT NULL,
    "contadorInstalacao" INT4 NOT NULL,
    "dataInstalacao" TIMESTAMP(3) NOT NULL,
    "dataUltimoContador" TIMESTAMP(3) NOT NULL,
    "status" "EmpressoraStatus" NOT NULL DEFAULT 'ATIVO',
    "unidadeId" STRING,

    CONSTRAINT "impressoras_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "impressoes" (
    "id" STRING NOT NULL,
    "impressora_id" STRING NOT NULL,
    "user_id" STRING NOT NULL,
    "data_impressao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nome_documento" STRING NOT NULL,
    "numero_paginas" INT4 NOT NULL,

    CONSTRAINT "impressoes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "impressoras_ip_key" ON "impressoras"("ip");

-- AddForeignKey
ALTER TABLE "impressoras" ADD CONSTRAINT "impressoras_codigoLocadora_fkey" FOREIGN KEY ("codigoLocadora") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "impressoras" ADD CONSTRAINT "impressoras_padrao_id_fkey" FOREIGN KEY ("padrao_id") REFERENCES "padroes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "impressoes" ADD CONSTRAINT "impressoes_impressora_id_fkey" FOREIGN KEY ("impressora_id") REFERENCES "impressoras"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "impressoes" ADD CONSTRAINT "impressoes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
