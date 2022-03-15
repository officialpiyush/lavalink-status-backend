import { config } from "dotenv";
config()

import express from "express";
import cors from "cors";

import "./lib/bot";

const app = express();

app.use(cors());

app.listen(process.env.PORT || 3000, () =>
  console.log(`🚀 Server ready at: ${process.env.PORT || 3000}`)
);