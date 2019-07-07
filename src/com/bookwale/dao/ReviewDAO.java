package com.bookwale.dao;



import java.util.Date;
import java.util.List;

import com.bookwale.entity.Review;

public class ReviewDAO extends JpaDAO<Review> implements GenericDAO<Review> {
	
	@Override
	public Review create(Review review) {
		review.setReviewTime(new Date());
		return super.create(review);
	}

	@Override
	public Review get(Object id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Object reviewId) {
		super.delete(Review.class, reviewId);
		
	}

	@Override
	public List<Review> listAll() {
		return super.findWithNamedQuery("Review.listAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Review.countAll");
	}

}
