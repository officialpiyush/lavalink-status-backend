import { config } from "dotenv";
config()

import express from "express";
import cors from "cors";

import "./lib/bot";
import StatsRoute from "./routes/StatsRoute";

const app = express();

app.use(cors());
app.use("/stats", StatsRoute)

app.listen(process.env.PORT || 3000, () =>
  console.log(`🚀 Server ready at: ${process.env.PORT || 3000}`)
);