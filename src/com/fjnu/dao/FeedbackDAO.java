package com.fjnu.dao;

import com.fjnu.domain.Feedback;

import java.util.List;

/**
 * Created by spzn on 16-2-20.
 */
public interface FeedbackDAO {
    public boolean InsertMessage(Feedback feedback);
    public List<Feedback> GetMessage();
}
