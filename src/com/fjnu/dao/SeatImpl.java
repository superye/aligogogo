package com.fjnu.dao;

import com.fjnu.domain.Seat;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by spzn on 16-2-13.
 */
public class SeatImpl implements SeatDAO{
    @Override
    public boolean InsertSeat(Seat seat) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("Seat.InsertMessage", seat);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        if (flag != 0) return true;
        else return false;
    }
    @Override
    public boolean DeleteSeat(Seat seat) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("Seat.DeleteSeat", seat);
            sqlSession.commit();
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        if (flag != 0) return true;
        return false;
    }

    @Override
    public boolean DeleteSeatByName(Seat seat) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("Seat.DeleteSeatByName", seat);
            sqlSession.commit();
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        if (flag != 0) return true;
        return false;
    }

    @Override
    public int GetClassroomNum(String station) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        Seat seat = new Seat();
        seat.setStation_name(station);
        List<Integer> list = new ArrayList<Integer>();
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("Seat.GetClassroomInfo", seat);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list.get(0);
    }

    @Override
    public List<Seat> GetStation() {
        List<Seat> list = new ArrayList<Seat>();
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("Seat.GetStation");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }

    @Override
    public List<Seat> GetSeat() {
        List<Seat> list = new ArrayList<Seat>();
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("Seat.GetSeat");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }

    @Override
    public List<Seat> GetStationId(Seat seat) {
        List<Seat> list = new ArrayList<Seat>();
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("Seat.GetStationId", seat);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }
}

