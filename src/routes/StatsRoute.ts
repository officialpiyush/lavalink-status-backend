import { Router } from "express";

const router = Router();

router.get("/stats", async (req, res) => {
    res.json({ hello: "world" })
    return
})

export default router;