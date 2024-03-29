package edu.example.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Data
@Setter
@Getter
public class Ticket {
    private int vid;
    private int agree;
    private int disagree;
    private String context;
    private String ntime;
    private int lim;
    private String title;
    private int state;
}
