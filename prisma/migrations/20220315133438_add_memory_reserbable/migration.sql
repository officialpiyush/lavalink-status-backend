/*
  Warnings:

  - Added the required column `memory_reservable` to the `Stats` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Stats" ADD COLUMN     "memory_reservable" DOUBLE PRECISION NOT NULL;
