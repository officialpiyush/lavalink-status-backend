/*
  Warnings:

  - You are about to alter the column `uptime` on the `Stats` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `BigInt`.
  - You are about to alter the column `memory_usage` on the `Stats` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `BigInt`.
  - You are about to alter the column `system_load` on the `Stats` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `BigInt`.
  - You are about to alter the column `load` on the `Stats` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `BigInt`.
  - You are about to alter the column `memory_reservable` on the `Stats` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `BigInt`.

*/
-- AlterTable
ALTER TABLE "Stats" ALTER COLUMN "uptime" SET DATA TYPE BIGINT,
ALTER COLUMN "memory_usage" SET DATA TYPE BIGINT,
ALTER COLUMN "system_load" SET DATA TYPE BIGINT,
ALTER COLUMN "load" SET DATA TYPE BIGINT,
ALTER COLUMN "memory_reservable" SET DATA TYPE BIGINT;
