package edu.example.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class Naiyou {
    private int vid;
    private String context;
    private String title;
    private int state;
    private int lim;
    private int agree;
    private int disagree;
    private String ntime;

}
