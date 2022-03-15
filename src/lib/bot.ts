
import { Client } from "discord.js";
import { Manager, Node } from "erela.js";
import config from "../../config";
import { prisma } from "./prisma";

const discordClient = new Client({
    intents: []
});

const manager = new Manager({
    nodes: config.nodes,
    send: () => null
});

function collectDataFromNodes() {
    const nodes = manager.nodes.array();

    for (const node of nodes) {
        try {
            addDataOfNode(node);
        } catch (error) {
            console.log("[Error Managing]", error);
        }
    }
}

async function addDataOfNode(node: Node) {
    const identifier = node.options.identifier ?? "Lavalink Server";
    const ip = `${node.options.host}:${node.options.port}`;
    const status = Number(node.connected);
    const players = node.stats.players;
    const playingPlayers = node.stats.playingPlayers;
    const uptime = node.stats.uptime;
    const cores = node.stats.cpu.cores;
    const memoryUsage = node.stats.memory.used;
    const memoryReservable = node.stats.memory.reservable;
    const systemLoad = node.stats.cpu.systemLoad;
    const lavalinkLoad = node.stats.cpu.lavalinkLoad;

    const hasIp = await prisma.nodes.findUnique({
        where: {
            ip
        }
    });

    if (!hasIp) {
        await prisma.nodes.create({
            data: {
                name: node.options.identifier,
                ip
            }
        })
    }

    await prisma.stats.create({
        data: {
            name: identifier,
            playing_players: playingPlayers,
            memory_usage: memoryUsage,
            memory_reservable: memoryReservable,
            system_load: systemLoad,
            load: lavalinkLoad,
            ip,
            status,
            players,
            uptime,
            cores,
        }
    })
}

discordClient.on("ready", () => {
    console.log("[BOT] Ready");
    manager.init(discordClient.user?.id);

    collectDataFromNodes();
    setInterval(collectDataFromNodes, 5000);
});


discordClient.login(process.env.TOKEN);