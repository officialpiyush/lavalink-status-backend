-- CreateTable
CREATE TABLE "Stats" (
    "id" SERIAL NOT NULL,
    "name" TEXT DEFAULT E'Lavalink Server',
    "ip" TEXT NOT NULL,
    "status" INTEGER NOT NULL,
    "players" INTEGER NOT NULL,
    "playing_players" INTEGER NOT NULL,
    "uptime" DECIMAL(65,30) NOT NULL,
    "cores" INTEGER NOT NULL,
    "memory_usage" DOUBLE PRECISION NOT NULL,
    "system_load" DOUBLE PRECISION NOT NULL,
    "load" DOUBLE PRECISION NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Stats_id_key" ON "Stats"("id");
