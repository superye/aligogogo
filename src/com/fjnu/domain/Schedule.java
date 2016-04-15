package com.fjnu.domain;

/**
 * Created by spzn on 16-2-19.
 */
public class Schedule {
    private CoachStudent[][] CSschedule = new CoachStudent[8][27];
    private IdleTime[][] ITschedule = new IdleTime[8][27];

    public IdleTime[][] getITschedule() {
        return ITschedule;
    }

    public void setITschedule(IdleTime[][] ITschedule) {
        this.ITschedule = ITschedule;
    }

    public CoachStudent[][] getCSschedule() {
        return CSschedule;
    }

    public void setCSschedule(CoachStudent[][] CSschedule) {
        this.CSschedule = CSschedule;
    }

    public void Clear() {
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 27; j++) {
                CSschedule[i][j] = null;
                ITschedule[i][j] = null;
            }
        }
    }
}
