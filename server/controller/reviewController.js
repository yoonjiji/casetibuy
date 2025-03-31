import * as repository from "../repository/reviewRepository.js";

export const addReview = async (req, res) => {    
    const result = await repository.addReview(req.body);
  res.json(result);
  res.end();
};

export const getReviewList = async (req, res) => {    
    const result = await repository.getReviewList(req.query.pid);
    res.json(result);
    res.end();
  };