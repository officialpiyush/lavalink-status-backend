/*
  Warnings:

  - You are about to drop the `Stats` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Stats";

-- CreateTable
CREATE TABLE "nodes" (
    "id" SERIAL NOT NULL,
    "name" TEXT DEFAULT E'Lavalink Server',
    "ip" TEXT NOT NULL,
    "created_at" BIGINT NOT NULL
);

-- CreateTable
CREATE TABLE "stats" (
    "id" SERIAL NOT NULL,
    "name" TEXT DEFAULT E'Lavalink Server',
    "ip" TEXT NOT NULL,
    "status" INTEGER NOT NULL,
    "players" INTEGER NOT NULL,
    "playing_players" INTEGER NOT NULL,
    "uptime" BIGINT NOT NULL,
    "cores" INTEGER NOT NULL,
    "memory_usage" BIGINT NOT NULL,
    "memory_reservable" BIGINT NOT NULL,
    "system_load" DECIMAL(65,30) NOT NULL,
    "load" DECIMAL(65,30) NOT NULL,
    "recorded_at" BIGINT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "nodes_id_key" ON "nodes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "nodes_ip_key" ON "nodes"("ip");

-- CreateIndex
CREATE UNIQUE INDEX "stats_id_key" ON "stats"("id");

-- AddForeignKey
ALTER TABLE "stats" ADD CONSTRAINT "stats_ip_fkey" FOREIGN KEY ("ip") REFERENCES "nodes"("ip") ON DELETE RESTRICT ON UPDATE CASCADE;
