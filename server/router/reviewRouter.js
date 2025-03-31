import express from "express";
import * as controller from "../controller/reviewController.js";

const router = express.Router();

router
  .post("/new", controller.addReview)
  .get("/list", controller.getReviewList)


export default router;
