/*
  Warnings:

  - The `created_at` column on the `nodes` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `recorded_at` column on the `stats` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "nodes" DROP COLUMN "created_at",
ADD COLUMN     "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "stats" DROP COLUMN "recorded_at",
ADD COLUMN     "recorded_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP;
