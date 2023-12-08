/*
  Warnings:

  - You are about to drop the column `contadorRetirada` on the `impressoras` table. All the data in the column will be lost.
  - You are about to drop the column `dataRetirada` on the `impressoras` table. All the data in the column will be lost.
  - You are about to drop the column `datacontadorRetirada` on the `impressoras` table. All the data in the column will be lost.
  - The `ultimoContador` column on the `impressoras` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "impressoras" RENAME COLUMN "contadorRetirada" TO "dataRetiradaOrld";
ALTER TABLE "impressoras" DROP COLUMN "dataRetiradaOrld";
ALTER TABLE "impressoras" RENAME COLUMN "dataRetirada" TO "dataRetiradaOld";
ALTER TABLE "impressoras" DROP COLUMN "dataRetiradaOld";
ALTER TABLE "impressoras" RENAME COLUMN "datacontadorRetirada" TO "dataContadorRetirada";
ALTER TABLE "impressoras" ADD COLUMN     "contadorRetiradas" INT4 NOT NULL DEFAULT 0;
ALTER TABLE "impressoras" ALTER COLUMN "codigoLocadora" DROP NOT NULL;
ALTER TABLE "impressoras" ALTER COLUMN "contadorInstalacao" SET DEFAULT 0;
ALTER TABLE "impressoras" ALTER COLUMN "dataInstalacao" DROP NOT NULL;
ALTER TABLE "impressoras" ALTER COLUMN "dataUltimoContador" DROP NOT NULL;
ALTER TABLE "impressoras" RENAME COLUMN "ultimoContador" TO "ultimoContadorOld";
ALTER TABLE "impressoras" DROP COLUMN "ultimoContadorOld";
ALTER TABLE "impressoras" ADD COLUMN     "ultimoContador" INT4 NOT NULL DEFAULT 0;
