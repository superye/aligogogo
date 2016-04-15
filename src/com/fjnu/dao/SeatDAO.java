package com.fjnu.dao;

import com.fjnu.domain.Seat;

import java.util.List;

/**
 * Created by spzn on 16-2-13.
 */
public interface SeatDAO {
    public boolean InsertSeat(Seat seat);
    public boolean DeleteSeat(Seat seat);
    public boolean DeleteSeatByName(Seat seat);
    public int GetClassroomNum(String station);
    public List<Seat> GetSeat();
    public List<Seat> GetStation();
    public List<Seat> GetStationId(Seat seat);
}
