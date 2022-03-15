import { Router } from "express";
import { prisma } from "../lib/prisma";

const router = Router();

router.get("/", async (req, res) => {
    const stats = await prisma.nodes.findMany({
        include: {
            stats: {
                take: 100
            }
        }
    });

    res.json(JSON.parse(JSON.stringify(stats, (key, value) =>
        typeof value === 'bigint'
            ? value.toString()
            : value
    )))

    return
})

export default router;